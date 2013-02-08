class AssetDigestCache
  @@asset_cache = {}
  def self.get_digest_hash
    if @@asset_cache.length == 0
      Rails.application.assets.each_logical_path { |a| @@asset_cache[a] = Rails.application.assets.find_asset(a).digest_path }
    end
    @@asset_cache
  end
end