class VkClient
  attr_reader :app, :access_token

  def initialize
    @app_id = 5901765
    @app = VK::Application.new
  end

  def autorized?
    @app.authorized?
  end

  def auth_url
    @app.authorization_url(
      type: :site,
      app_id: @app_id,
      redirect_url: "http://localhost:3000/auth",
      settings: "wall,groups,stats",
      version: "5.26"
    )
  end

  def authorize(options)
    @access_token = options.fetch(:access_token)
    @app = VK::Application.new(
      app_id: @app_id,
      access_token: @access_token,
      settings: "wall, groups,stats",
      version: "5.26"
    )
  end

  def find_user(s)
    @app.users.get(user_ids: s)
  end

  def find_groups(uid)
    @app.groups.get(user_id: uid, count: 1000, extended: 1, filter: "admin")
  end

  def get_stats(opts = {})
    gid = opts.fetch(:gid)
    date_from = opts.fetch(:date_from)
    date_to = opts.fetch(:date_to)
    @app.stats.get(group_id: gid, date_from: date_from, date_to: date_to)
  end

  def get_posts(gid)
    probe = @app.wall.get(owner_id: "-#{gid}", filter: "owner")
    step = 100
    pages = probe['count'] / step
    (0..pages).reduce([]) do |acc, i|
      resp = @app.wall.get(owner_id: "-#{gid}", filter: "owner", offset: step * i, count: step)
      acc + resp['items']
    end
  end
end
