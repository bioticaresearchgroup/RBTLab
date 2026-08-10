/*
  CAROUSEL.JS
  Drives the homepage carousel(s) (see _includes/carousel.html).
  - Item-based paged scrolling: translates the track by one item width.
  - Loops around, autoplays every 8 s, pauses while hovered, supports
    touch swipe (>40 px), prev/next buttons, counter ("1 / N"), and
    recomputes max pages on window resize.
*/
{
  const init = () => {
    document.querySelectorAll("[data-carousel]").forEach((el) => {
      const wrapper = el.querySelector(".carousel-wrapper");
      const track = el.querySelector("[data-carousel-track]");
      if (!wrapper || !track) return;
      const counter = el.querySelector("[data-carousel-count]");
      const items = track.children;
      if (items.length === 0) return;

      const step = () => {
        const style = getComputedStyle(items[0]);
        return items[0].offsetWidth + parseFloat(style.marginLeft) + parseFloat(style.marginRight);
      };

      let currentIndex = 0;
      let maxIndex = 0;

      const update = () => {
        track.style.transform = `translateX(-${currentIndex * step()}px)`;
        if (counter) counter.textContent = `${currentIndex + 1} / ${maxIndex + 1}`;
      };

      const compute = () => {
        maxIndex = Math.max(0, track.scrollWidth - wrapper.clientWidth);
        maxIndex = Math.round(maxIndex / step());
        if (currentIndex > maxIndex) currentIndex = maxIndex;
        update();
      };

      const next = () => {
        currentIndex = currentIndex >= maxIndex ? 0 : currentIndex + 1;
        update();
      };

      const prev = () => {
        currentIndex = currentIndex <= 0 ? maxIndex : currentIndex - 1;
        update();
      };

      el.querySelector("[data-carousel-prev]")?.addEventListener("click", prev);
      el.querySelector("[data-carousel-next]")?.addEventListener("click", next);

      let startX = null;
      track.addEventListener("touchstart", (e) => {
        startX = e.touches[0].clientX;
      }, { passive: true });
      track.addEventListener("touchend", (e) => {
        if (startX === null) return;
        const dx = e.changedTouches[0].clientX - startX;
        if (Math.abs(dx) > 40) (dx < 0 ? next() : prev());
        startX = null;
      }, { passive: true });

      let timer = setInterval(next, 8000);
      el.addEventListener("mouseenter", () => clearInterval(timer));
      el.addEventListener("mouseleave", () => {
        clearInterval(timer);
        timer = setInterval(next, 8000);
      });

      window.addEventListener("resize", compute);
      compute();
    });
  };

  window.addEventListener("DOMContentLoaded", init);
  window.addEventListener("load", init);
}