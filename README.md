# DB DESIGN

## table list
```
- users
- protptypes
- comments
- images
- likes
```

## Users

### Associations
```
- has_many :prototypes
- has_many :comments
- has_many :likes
```

### Column
```
- id :integer
- name :string
- email :string(devise)
- password :string (devise)
- avator :string(carrierwave)
- member :string
- profile :text
- works :string
```

## Prototypes

### Associations
```
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :images
- has_many :tags, :through => :prototype_tags
```

### Column
```
- id :integer
- image_title :string
- cach_copy :string
- concept :text
- user_id :integer
```

## Comments

### Associations
```
- belongs_to :user
- belongs_to :prototype
```

### Column
```
- id :integer
- text :text
- prototype_id :integer
- user_id :integer
```

## Images

### Associations
```
- belongs_to :prototype
```

### Column
```
- id :integer
- status :string(carrierwave)
- prototype_id :integer
```

## Likes

### Associations
```
- belongs_to :prototype
- belongs_to :user
```

### Column
```
- id :integer
- user_id :integer
- prototype_id :integer
```

## tags

### Associations
```
- has_many :prototype_tags
- has_many :prototypes, :through => :prototype_tags
```

### Column
```
- id :integer
- name :string
```

## prototype_tags

### Associations
```
- belongs_to :prototype
- belongs_to :tag
```

### Column
```
- id :integer
- prototype_id :string
- tag_id :string
```

