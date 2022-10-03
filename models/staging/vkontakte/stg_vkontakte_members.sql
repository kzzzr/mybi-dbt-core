select 

	  id
	, account_id
	, member_id
	, first_name
	, last_name
	, bdate
	, sex
	, [domain]
	, deactivated
	, status
	, photo_50
	, photo_100
	, photo_200
	, site
	, skype
	, facebook
	, facebook_name
	, instagram
	, twitter
	, has_mobile
	, mobile_phone
	, home_phone
	, can_post
	, can_see_all_posts
	, can_see_audio
	, can_write_private

from {{ source('vkontakte', 'members') }}

{{ source_filter_rows(
    account_id=var('account_id_vkontakte')
) }}