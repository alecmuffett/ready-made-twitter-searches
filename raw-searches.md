## -*- awk -*- Emacs highlighting for AWK looks nice

## queries separated by single-hash H1 headers
## comments are double-hash H2 headers
## currently no quote-escapes nor sanity-checking, sorry

## eg: https://twitter.com/search?q=foo%20OR%20bar%20AND%20(baz%20OR%20wibble)&src=typed_query&f=live

# end-to-end encrypted apps

"+@briarapp" OR
"+@element_hq" OR
"+@matrixdotorg" OR
"+@messenger" OR
"+@mywickr" OR
"+@r2refresh" OR
"+@signalapp" OR
"+@telegram" OR
"+@threema" OR
"+@torproject" OR
"+@wa_status" OR
"+@whatsapp" OR
"+@wire"

# breaking end-to-end encryption

"break e2e" OR
"break e2ee" OR
"break encryption" OR
"break end to end" OR
"break endToEndEncryption" OR
"breaking e2e" OR
"breaking e2ee" OR
"breaking encryption" OR
"breaking end to end" OR
"breaking endToEndEncryption" OR
"undermine e2e" OR
"undermine e2ee" OR
"undermine encryption" OR
"undermine end to end" OR
"undermine endToEndEncryption" OR
"chat control" OR
"chatcontrol" OR
"chatkontrolle" OR
(
    "backdoor" AND
    (
        "e2e" OR
        "e2ee" OR
        "end to end" OR
        "endToEnd" OR
        )
    )

# end-to-end encryption keywords

"e2ee" OR
"endToEndEncryption" OR
"lawless spaces" OR
"lawlesspaces" OR
"lawlessspaces" OR
"warrant proof" OR
"warrantproof" OR
(
    (
        "algorithm" OR
        "algorithms" OR
        "e2e" OR
        "end to end" OR
        "facebook" OR
        "instagram" OR
        "messenger" OR
        "unregulated" OR
        "whatsapp" OR
        "nspcc"
        ) AND
    (
        "encrypt" OR
        "encrypted" OR
        "encryption" OR
        "encryptions"
        )
    )

# age verification keywords

"age assurance" OR
"digital economy act" OR
"verification of children online" OR
"#voco" OR
"ageappropriatedesigncode" OR
"ageassurance" OR
"ageverification" OR
"ageverificationsystems" OR
"childrenscode" OR
"harveyslaw" OR
"onlineageverification" OR
"pas1296" OR
"trackatroll"

# age verification simple text

"age verification"

# uk social media identity petitions

* https://twitter.com/AlecMuffett/status/1370018001509097474
* https://twitter.com/AlecMuffett/status/1370091171461144579
* https://www.openrightsgroup.org/blog/saveanonymity-together-we-can-defend-anonymity/
* https://www.huffingtonpost.co.uk/entry/katie-price-track-a-troll-petition-criticism_uk_604f2a25c5b60e0725f8e9aa
* https://twitter.com/AlecMuffett/status/1414525963250110465

"#saveanonymity" OR
"#trackatroll" OR
(
    "https://petition.parliament.uk/petitions/575833" AND
    -"Make verified ID a requirement for opening" ## canned "share" phrase, reduces noise
    ) OR
(
    (
        "katie price" OR
        "+@katieprice"
        ) AND
    "petition"
    )

# pegasus project

* https://twitter.com/jsrailton/status/1416792857084583939
* https://www.theguardian.com/news/series/pegasus-project
* https://thewire.in/government/project-pegasus-journalists-ministers-activists-phones-spying
* https://www.amnesty.org/en/latest/research/2021/07/forensic-methodology-report-how-to-catch-nso-groups-pegasus/

"#nsoGroup" OR
"#pegasusProject" OR
"israeli spyware" OR
"nso group" OR
"pegasus project" OR
( "nso" AND "spyware")
