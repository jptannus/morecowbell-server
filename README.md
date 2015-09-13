# More Cowbell - Server
This is the server structure for the mobile app More Cowbell.

## Endpoints:

### List Entries
**method**: GET

**path**: /entries

**params**:
  * **limit**: maximum number of elements to return.
  * **after**: id from the entry used as reference to get only the records created after it. **If this is used the offset param will be ignored**.
  * **offset**: position from where to start listing the itens. **This operation don't performe well on big lists, use *after* instead**.

### Create Entry
**method**: POST

**path**: /entries

**payload:**
  * **title:** title off the new entry.
  * **source** url to the video source of the entry.

### Delete Entry
**method**: DELETE

**path**: /entries/{entryId}
