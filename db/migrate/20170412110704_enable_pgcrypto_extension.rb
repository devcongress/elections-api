class EnablePgcryptoExtension < ActiveRecord::Migration[5.0]
  def change
    enable_extension :pgcrypto
  end
end
