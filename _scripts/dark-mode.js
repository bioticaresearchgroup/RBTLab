/*
  DARK-MODE.JS
  Manages light/dark theme.
  - Reads the saved preference from localStorage BEFORE first paint and
    sets <html data-dark="true|false">, which drives all theme CSS.
  - Keeps every .dark-toggle checkbox in sync.
  - Exposes window.onDarkToggleChange() used by the toggle control in
    the header; saves the choice back to localStorage.
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
