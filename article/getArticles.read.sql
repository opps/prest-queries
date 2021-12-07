SELECT
  articles_post.headline,
  articles_post.short_title,
  articles_post.content,
  containers_container.channel_long_slug,
  containers_container.channel_id,
  containers_container.channel_name,
  containers_container.slug,
  containers_container.title,
  containers_container.source,
  containers_container.hat,
  containers_container.main_image_caption,
  containers_container.child_app_label,
  containers_container.date_update,
  channels_channel.parent_id,
  images_image.title as imageAltText,
  images_image.archive as imagePath

FROM containers_container
  LEFT JOIN
    articles_post ON containers_container.id = articles_post.container_ptr_id

  LEFT JOIN
    images_image ON containers_container.main_image_id = images_image.id

  {{if inFormat "parent_channel slug_channel"}}
  INNER JOIN
    channels_channel ON containers_container.channel_id = channels_channel.id
  {{end}}

  WHERE
    containers_container.published = true

  {{if isSet "search"}}
    AND (containers_container.title LIKE '{{.search}}' OR
        articles_post.content LIKE '{{.search}}')
  {{end}}

  {{if isSet "channel"}}
    AND containers_container.channel_id = {{.channel}}
  {{end}}

  {{if isSet "parent_channel"}}
    AND channels_channel.parent_id = {{.parent_channel}}
  {{end}}

  {{if isSet "slug_channel"}}
    AND channels_channel.long_slug = '{{.slug_channel}}'
  {{end}}

  ORDER BY containers_container.date_insert DESC

  {{limitOffset ._page ._page_size}}
