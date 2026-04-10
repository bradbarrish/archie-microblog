(function () {
  function getPreferred() {
    var saved = localStorage.getItem("theme");
    if (saved) return saved;
    return window.matchMedia("(prefers-color-scheme: dark)").matches
      ? "dark"
      : "light";
  }

  function apply(theme) {
    document.documentElement.setAttribute("data-theme", theme);
    localStorage.setItem("theme", theme);
    var btn = document.querySelector(".theme-toggle");
    if (btn) btn.textContent = theme === "dark" ? "light" : "dark";
  }

  // Apply immediately to prevent flash
  apply(getPreferred());

  document.addEventListener("DOMContentLoaded", function () {
    apply(getPreferred());
    var btn = document.querySelector(".theme-toggle");
    if (btn) {
      btn.addEventListener("click", function () {
        var current = document.documentElement.getAttribute("data-theme");
        apply(current === "dark" ? "light" : "dark");
      });
    }
  });
})();
