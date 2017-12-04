* Clone thư mục này nằm trong htdocs
* Trong htdocs, tạo 1 file tên là .htaccess với nội dung:

```
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^ index.html [R=301,L]
```
* Để đăng nhập, gửi một request POST đến URL ```localhost/server/login```
với data:
```
{
  email: nguyenminhtrung@gmail.com,
  password: 123456789
}
```
* Những request khác làm tương tự

### Trang admin
* URL sẽ là ```localhost/server/admin.php```