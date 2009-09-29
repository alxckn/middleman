
#  config.relative_assets = true

  def asset_url(path)
    if path.include?("://")
      path
    else
      request_path = request.path_info.dup
      request_path << "index.html" if path.match(%r{/$})
      request_path.gsub!(%r{^/}, '')
      parts = request_path.split('/')
      
      if parts.length > 1
        "../" * (parts.length - 1) + path
      else
        path
      end
    end
  end
end