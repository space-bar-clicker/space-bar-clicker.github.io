#!/bin/bash

# Array of game folders to delete and untrack
GAMES=(
  "brainrot-clicker"
  "burger-clicker"
  "candy-clicker"
  "candy-clicker-2"
  "capybara-clicker"
  "capybara-clicker-2"
  "case-clicker"
  "case-clicker-2"
  "chicken-jockey-clicker"
  "chill-girl-clicker"
  "chill-guy-clicker"
  "clicker-counter"
  "coin-clicker"
  "cookie-clicker"
  "cookie-clicker-2"
  "cps-test"
  "csgo-clicker"
  "dog-clicker"
  "duck-clicker"
  "duck-duck-clicker"
  "duck-duck-clicker-3d"
  "earth-clicker"
  "gs-auto-clicker"
  "italian-brainrot-clicker"
  "kiwi-clicker"
  "labubu-clicker"
  "minecraft-clicker"
  "money-clicker"
  "op-auto-clicker"
  "particle-clicker"
  "pizza-clicker"
  "planet-clicker"
  "planet-clicker-2"
  "plant-clicker"
  "pokemon-clicker"
  "roblox-clicker"
  "robux-clicker"
  "room-clicker"
  "santa-clicker"
  "sprunki-clicker"
  "stimulation-clicker"
  "tube-clicker"
  "tung-tung-tung-sahur-clicker"
  "whopper-clicker"
)

echo "Starting clean up of other games..."

# 1. Remove folders from Git tracking
echo "Removing games from Git cache..."
for game in "${GAMES[@]}"; do
  if [ -d "$game" ]; then
    git rm -r --cached "$game" 2>/dev/null || true
  fi
done

# 2. Delete folders from local disk
echo "Deleting game directories from disk..."
for game in "${GAMES[@]}"; do
  if [ -d "$game" ]; then
    rm -rf "$game"
    echo "Deleted: $game"
  fi
done

# 3. Stage modified tracking config files
echo "Staging .gitignore, index.html, and sitemap.xml..."
git add .gitignore index.html sitemap.xml

echo "Done! You can now commit and push the changes:"
echo "  git commit -m \"Remove all games except spacebar clicker for SEO ranking test\""
echo "  git push"

# Self-destruct script option or keep for reference?
# Let's prompt user to delete it or run: rm remove_other_games.sh
