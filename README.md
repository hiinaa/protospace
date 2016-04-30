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
```

### Column
```
- id :integer
- title :string
- cach_copy :string
- concept :text
- user_id :string
```

