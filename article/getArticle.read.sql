SELECT
  articles_post.headline,
  articles_post.short_title,
  articles_post.content,
  containers_container.channel_long_slug,
  containers_container.channel_id,
  containers_container.channel_name,
  containers_container.source,
  containers_container.slug,
  containers_container.tags,
  containers_container.title,
  containers_container.hat,
  containers_container.main_image_caption,
  containers_container.child_app_label,
  images_image.title as imageAltText,
  images_image.archive as imagePath,
  containers_container.date_update

FROM containers_container
  LEFT JOIN
    articles_post ON containers_container.id = articles_post.container_ptr_id
  LEFT JOIN
    images_image ON containers_container.main_image_id = images_image.id
  WHERE
    containers_container.published = true

  {{if isSet "slug"}}
    AND containers_container.slug = '{{.slug}}'
  {{end}}
