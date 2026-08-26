// Typst show rule - connects Quarto to our template
#show: doc => article(
$if(title)$
  title: [$title$],
$endif$
$if(by-author)$
  authors: (
$for(by-author)$
    ( name: [$it.name.literal$] ),
$endfor$
  ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(margin)$
  margin: ($for(margin/pairs)$$it.key$: $it.value$,$endfor$),
$endif$
$if(papersize)$
  paper: "$papersize$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
$if(cv-name)$
  name: "$cv-name$",
$endif$
$if(cv-email)$
  email: "$cv-email$",
$endif$
$if(cv-phone)$
  phone: "$cv-phone$",
$endif$
$if(cv-url)$
  url: "$cv-url$",
$endif$
$if(cv-orcid)$
  orcid: "$cv-orcid$",
$endif$
$if(cv-github)$
  github: "$cv-github$",
$endif$
$if(cv-address)$
  address: "$cv-address$",
$endif$
$if(cv-date)$
  date: "$cv-date$",
$endif$
  doc,
)
