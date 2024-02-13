```typescript
      addUser(name: string, profileImage: File): Observable<any> {
        var formData: any = new FormData();
        formData.append("name", name);
        formData.append("avatar", profileImage);

            return this.http.post('http://localhost:61265/api/DeliverySys/',formData,{
              reportProgress: true,
              observe: 'events'//now when you will subscribe you will get the events, in his case he neded responseType: 'blob', because from the back end he was receiving the blob too.
            });
       }
```

Then just the call the method like so:

```typescript
this.fileUploadService
  .addUser(this.form.value.name, this.form.value.avatar)
  .subscribe((event: HttpEvent<any>) => {
    switch (event.type) {
      case HttpEventType.Sent:
        console.log("Request has been made!");
        break;
      case HttpEventType.ResponseHeader:
        console.log("Response header has been received!");
        break;
      case HttpEventType.UploadProgress:
        this.progress = Math.round((event.loaded / event.total) * 100);
        console.log(`Uploaded! ${this.progress}%`);
        break;
      case HttpEventType.Response:
        console.log("User successfully created!", event.body);
        //add whatever thing you have to do here.
        setTimeout(() => {
          this.progress = 0;
        }, 1500);
    }
  });
```

- https://stackoverflow.com/questions/68782557/how-to-cast-event-to-return-httpeventtype-response-when-subscribe-data/68782753#68782753
  - https://www.positronx.io/angular-file-upload-with-progress-bar-tutorial/
- https://angular.io/guide/http-track-show-request-progress
- `if (event instanceof HttpResponse) {` https://stackoverflow.com/questions/47409225/where-and-how-to-use-httpresponse-in-angular2
- https://angular.io/guide/http
