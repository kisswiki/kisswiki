```html
<input
  style="display: none"
  type="file"
  multiple
  (change)="onFileChanged($event)"
  #fileInput
/>
<input
  type="button"
  class="upload-button"
  value="Upload attachment(s)"
  (click)="fileInput.click()"
/>
```

```typescript
onFileChanged(event) {
    const uploadData = event.target.files[0];
    this.http.post('url', uploadData, {
        reportProgress: true,
        observe: 'events'
    }).subscribe(event => {
        console.log('uploaded successfully');
    });
}
```

https://stackoverflow.com/questions/48444168/how-to-trigger-the-file-upload-input-in-angular/53101869#53101869
