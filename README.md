### data/units.json

This file is loaded by the extension from this same repo. It has information
about all the units in the game, along with a link to the wiki page, and
a link to the official Wiki panel picture with all the unit information.

When a unit change we should update it here. You can make a pull request if you want.

### Changelog

- 0.1.0 (in development)
  - Inject script into the subreddit page and match the whole name of units
  - Load units names from the Prismata Wiki
  - Load units pictures on-demand from the Prismata Wiki
  - Display the unit picture on mouse hover
- 0.2.0 (planned)
  - Account for common spelling mistakes and differences
  - Match prismata post on the front page too
- 0.3.0 (planned)
  - Add little icons next to each match, use the CSS from the flairs
  - Replace standalone letters of basic unit with icons too
- 0.4.0 (planned)
  - Add a toolbox for injecting units when creating a post or a comment
- 0.5.0 (planned)
  - Automatically replace units with CSS-friendly equivalent to display icons and allow non-extensions users to see icons too
- 0.6.0 (planned)
  - Add links to unlinked replays, and automatically generate link when writing on the toolbox
- 0.7.0 (planned)
  - Add title to common Prismata acronyms and automatically generate CSS-friendly acronym with the toolbox