/*
  manages light/dark mode.
*/

{
  // immediately load saved (or default) mode before page renders
  document.documentElement.dataset.dark =
    window.localStorage.getItem("dark-mode") ?? "false";

  const syncToggles = () => {
    const value = document.documentElement.dataset.dark === "true";
    document.querySelectorAll(".dark-toggle").forEach((toggle) => {
      toggle.checked = value;
    });
  };

  const onLoad = () => {
    syncToggles();
  };

  // after page loads
  window.addEventListener("load", onLoad);

  // when user toggles mode button
  window.onDarkToggleChange = (event) => {
    const value = event.target.checked;
    document.documentElement.dataset.dark = value;
    window.localStorage.setItem("dark-mode", value);
    syncToggles();
  };
}
