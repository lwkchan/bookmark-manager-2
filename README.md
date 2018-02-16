# Bookmark Manager

### User story

```
As a user
So that I can see my bookmarked pages
I want to be able to see a list of links

As a user
So that I can save bookmarks
I want to be able to add a link to the bookmarks list

As a user,
so I can manage my bookmark manager
I would like to delete a link

As a user,
so I can manage my bookmark manager
I would like to update a link

```

### Domain model

```   
 (client)                           (server)
CONTROLLER ----retrieve links-----> BOOKMARKS
    |                                   |
    |      <--------[links]---------    |
```
