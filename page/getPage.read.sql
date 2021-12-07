SELECT
  containers_container.title,
  flatpages_flatpage.content,
  containers_container.main_image_caption,
  images_image.title as imageAltText,
  images_image.archive as imagePath,
  containers_container.date_update

FROM flatpages_flatpage

INNER JOIN
  containers_container
  ON flatpages_flatpage.container_ptr_id = containers_container.id

LEFT JOIN
  images_image
  ON containers_container.main_image_id = images_image.id

WHERE
  containers_container.slug = '{{.slug}}'
