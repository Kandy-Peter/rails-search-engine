const http = require("packs/functions/requests");
const helpers = require("packs/functions/helpers");
const dom = require("packs/functions/dom");

document.addEventListener("turbolinks:load", function () {
  const searchBox = document.getElementById("index-search-box");
  const welcomeScreen = document.getElementById("index-welcome");
  const articlesContainer = document.getElementById("index-articles-container");
  const token = document.getElementsByName("csrf-token")[0].content;
  let session_identifier = Date.now();

  const updateDom = (data) => {
    articlesContainer.innerHTML = "";
    welcomeScreen.classList.add("display-none");
    articlesContainer.classList.remove("display-none");
    searchBox.value.length === 0
      ? dom.displayWelcomeScreen(welcomeScreen, articlesContainer)
      : data.errors.length > 0
      ? dom.appendError(data, articlesContainer)
      : dom.appendResults(data, articlesContainer);
  };

  const getData = helpers.debounce(async () => {
    const result = await http.post(
      {
        search: searchBox.value.trim().replace(/[?.!]/g, "").toLowerCase(),
        session_identifier: session_identifier,
      },
      token
    );
    updateDom(result);
  }, 500);

  searchBox.addEventListener("input", function (event) {
    if (event.which != 8) {
      searchBox.value.trim().length > 0
        ? getData()
        : ((session_identifier = Date.now()), updateDom());
    }
  });
});
