## -*- awk -*- Emacs highlighting for AWK looks nice

## queries separated by single-hash H1 headers
## comments are double-hash H2 headers
## currently no quote-escapes nor sanity-checking, sorry

## eg: https://twitter.com/search?q=foo%20OR%20bar%20AND%20(baz%20OR%20wibble)&src=typed_query&f=live

# end-to-end encryption app discussion

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

"breaking e2e" OR
"breaking e2ee" OR
"breaking encryption" OR
"breaking end to end" OR
"breaking endToEndEncryption" OR
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
