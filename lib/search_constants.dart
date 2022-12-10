// Types of search results
// Also used as the titles of the tabs :)
const userSearch = "Users";
const songSearch = "Songs";
const albumSearch = "Albums";
const artistSearch = "Artists";

// Search behaviors (Decides how search pages act)

// The default; Shows all results of the given types, clicking on them causes default clicking behavior
const homepageBehavior = "HOMEPAGE";
// For setting favorites on your profile; clicking on a search result will tell the profile page to update your favorites
// Requires an additional viewModel parameter for Navigator.pushNamed()
const settingFavoriteBehavior = "FAVORITE";
// For attaching a song to a post; clicking on a search result will tell the final upload page that it is the song that goes with this post
// Requires an additional viewModel parameter for Navigator.pushNamed()
const attachingSongBehavior = "ATTACH";
// For viewing followers of your profile; limits the search results to followers only
const followersBehavior = "FOLLOWERS";
// For viewing the users you follow; limits the search results to following only
const followingBehavior = "FOLLOWING";