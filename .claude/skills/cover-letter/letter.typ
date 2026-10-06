#set page(paper: "a4", margin: (x: 2.0cm, top: 1.9cm, bottom: 1.9cm))
#set text(font: ("Helvetica Neue", "Helvetica", "Arial"), size: 10.5pt, fill: rgb("#1a1a1a"))
#set par(justify: false, leading: 0.72em, spacing: 1.15em)
#show link: set text(fill: rgb("#3a3a3a"))
#set list(indent: 4pt, spacing: 0.9em)

#text(size: 17pt, weight: "bold", tracking: 1.6pt)[$if(name)$$name$$else$ZORAN MARKOVIC$endif$]
#v(-4pt)
#text(size: 10.5pt)[$if(tagline)$$tagline$$else$Senior Front-end Engineer & Technical Lead · Berlin, Germany$endif$]
#v(-6pt)
// One contact item per line, never joined on one line: email, GitHub, LinkedIn.
#text(size: 9pt, fill: rgb("#555555"))[$if(contact)$$contact$$else$markonimobile\@gmail.com \
#link("https://github.com/orgs/agenticDraft/repositories")[https://github.com/orgs/agenticDraft/repositories] \
#link("https://linkedin.com/in/zoranzokimarkovic/")[https://linkedin.com/in/zoranzokimarkovic/]$endif$]
#v(2pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cfcfcf"))
#v(2pt)

#text(weight: "bold")[Application: $role$ — $company$$if(location)$ ($location$)$endif$]

$body$
