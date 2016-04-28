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
- avator :string(CarrierWave)
- member :string
- profile :text
- works :string
```
