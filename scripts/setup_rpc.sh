echo "Creating desktop launcher for Send to Cleaner..."

mkdir -p /home/user/.local/share/applications

cat << EOF > /home/user/.local/share/applications/send-to-cleaner.desktop
[Desktop Entry]
Type=Application
Name=Send to Cleaner
Exec=/home/user/send_to_cleaner.sh %F
Icon=application-x-executable
Terminal=true
Categories=Utility;
MimeType=inode/directory;image/jpeg;image/png;image/gif;image/bmp;image/tiff;
EOF

chmod +x /home/user/.local/share/applications/send-to-cleaner.desktop

update-desktop-database ~/.local/share/applications/
