module Ancient_Tome
  def decrypt(enemy)
    puts "#{enemy.name} is decrypted! What!!"
    enemy.health -= 50
  end

  def cook_tree_bark_soup
    puts "yum"
    @health += 1
  end
end
