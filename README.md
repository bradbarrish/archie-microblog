# Brad Barrish's Micro.blog theme

A custom Micro.blog theme for [bradbarrish.com](https://bradbarrish.com), based on the minimal Archie layout.

## Blogroll

The homepage sidebar reads from `data/blogroll.json`. Each entry has a linked name and an optional Markdown description. The sidebar hides itself when the list is empty and links to Micro.blog's native OPML and JSON recommendation exports.

The theme settings control the heading, introduction, and number of links shown.

## Now page

The theme bundles `content/now.md`, which publishes at `/now/`. Update that Markdown file and the `lastmod` date whenever the snapshot changes. The navigation link is part of the theme, so it does not need to be added separately in Micro.blog's Pages settings.

## Raindrop link posts

The simplest reliable automation uses Raindrop's collection RSS feed and Micro.blog's native source importer:

1. Create a dedicated collection in Raindrop, such as `Link Posts`.
2. In the collection, open Share -> Public page and enable sharing.
3. Copy the collection's RSS URL.
4. In Micro.blog, add that URL under Sources and choose `Import posts to blog` for bradbarrish.com.
5. Add one test bookmark and confirm the title, excerpt, image, and categories look right before using the collection normally.

Raindrop's RSS feed uses the original link as each item's GUID, so Micro.blog can avoid importing the same bookmark more than once. The tradeoff is that the Raindrop collection must be public. If the collection needs to stay private or the post format needs custom editorial text, use a scheduled API bridge with a Raindrop token and Micro.blog app token instead.
