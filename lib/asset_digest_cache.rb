class AssetDigestCache
  @@asset_cache = {}
  def self.get_digest_hash
    if @@asset_cache.length == 0
      Rails.application.assets.each_logical_path do |a|
        if a.include?('png') || a.include?('jpg')
          @@asset_cache[a] = Rails.application.assets.find_asset(a).digest_path
        end
      end
    end
    @@asset_cache
  end
end