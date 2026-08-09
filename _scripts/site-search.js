/*
  SITE-SEARCH.JS
  Powers the site-wide search form (see _includes/site-search.html).
  On submit it redirects the visitor to a Google search restricted to the
  current site domain: https://www.google.com/search?q=site:<domain> <query>
*/

{
  // when user submits site search form/box
  window.onSiteSearchSubmit = (event) => {
    event.preventDefault();
    const google = "https://www.google.com/search?q=site:";
    const site = window.location.origin;
    const query = event.target.elements.query.value;
    window.location = google + site + " " + query;
  };
}
