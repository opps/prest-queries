SELECT
    channels_channel.id,
    channels_channel.date_insert,
    channels_channel.date_update,
    channels_channel.user_id,
    channels_channel.site_id,
    channels_channel.site_iid,
    channels_channel.site_domain,
    channels_channel.date_available,
    channels_channel.published,
    channels_channel.slug,
    channels_channel.name,
    channels_channel.long_slug,
    channels_channel.layout,
    channels_channel.description,
    channels_channel.show_in_menu,
    channels_channel.include_in_main_rss,
    channels_channel.homepage,
    channels_channel.group,
    channels_channel.order,
    channels_channel.parent_id,
    channels_channel.lft,
    channels_channel.rght,
    channels_channel.tree_id,
    channels_channel.level,
    channels_channel.hat,
    channels_channel.paginate_by,
    channels_channel.main_image_id,
    channels_channel.menu_url_target,
    channels_channel.tags,
FROM channels_channel
  INNER JOIN
    containers_container ON channels_channel.container_ptr_id = containers_container.id
  WHERE
    containers_container.published = true
