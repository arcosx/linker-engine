# linker-engine
Linker Engine,the backend for linker https://github.com/arcosx/linker


[THE APIDOC(JUST FOR TEST)](https://documenter.getpostman.com/view/1995352/RzZ7mzfM)

### 建表
```sql
create database `linker` character set utf8 collate utf8_general_ci;
```
### 注意事项
#### 循环建表 错误删除
1. 注释掉 profile.models.py 中的再进行 makemigration
```python
    follows = models.ManyToManyField(
        'self', 
        related_name='followed_by',
        symmetrical=False
    )

    favorites = models.ManyToManyField(
        'cards.Card',
        related_name='favorited_by'
    )
```
2. 取消注释之后再次进行 makemigration
3. migrate