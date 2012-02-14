TorqueBox.configure do
  service CacheIncrementService do
    config do
      name "increasing-cache"
    end
  end
end
