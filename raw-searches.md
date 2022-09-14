## -*- awk -*- Emacs highlighting for AWK looks nice

## QUERIES separated by single-hash H1 headers
## COMMENTS are double-hash H2 headers
## currently no quote-escapes nor sanity-checking, sorry
## eg: https://twitter.com/search?q=foo%20OR%20bar%20AND%20(baz%20OR%20wibble)&src=typed_query&f=live

## note to self: trying to anchor searches to user mentions ("+@foo")
## tends to yield poor results over/above free text search; possibly
## this is a Twitter search backend restriction for CPU use, or a
## safety measure?

## helper: <foo bar> expands to: "foo bar" OR "FooBar"

# End-To-End Encryption: Apps | twitter accounts for a selection of messaging apps

"+@briarapp"
OR "+@element_hq"
OR "+@matrixdotorg"
OR "+@messenger"
OR "+@mywickr"
OR "+@r2refresh"
OR "+@session_app"
OR "+@signalapp"
OR "+@telegram"
OR "+@threema"
OR "+@torproject"
OR "+@wa_status"
OR "+@whatsapp"
OR "+@wire"

# End-To-End Encryption: Breaking | discussion of weakening E2EE, backdoors, and #chatcontrol

"break e2e"
OR "break e2ee"
OR "break encryption"
OR "break end to end"
OR "break endToEndEncryption"
OR "breaking e2e"
OR "breaking e2ee"
OR "breaking encryption"
OR "breaking end to end"
OR "breaking endToEndEncryption"
OR "chat control"
OR "chatcontrol"
OR "chatkontrolle"
OR "undermine e2e"
OR "undermine e2ee"
OR "undermine encryption"
OR "undermine end to end"
OR "undermine endToEndEncryption"
OR (
    "backdoor"
    AND (
        "e2e"
        OR "e2ee"
        OR "end to end"
        OR "endToEnd"
        )
    )

# End-To-End Encryption: General | including regulation, law enforcement, and platforms

<chat control>
OR <chat kontrolle>
OR "e2ee"
OR "endToEndEncryption"
OR <lawless spaces>
OR "lawlessspaces"
OR "noplacetohide" ## UK campaign
OR <warrant proof>
OR (
    (
        "algorithm"
        OR "algorithms"
        OR "e2e"
        OR "end to end"
        OR "facebook"
        OR "instagram"
        OR "law enforcement"
        OR "messenger"
        OR "nspcc"
        OR "unregulated"
        OR "whatsapp"
        OR "bout en bout"
        )
    AND (
        "chiffre"
        OR "chiffrement"
        OR "cryptage"
        OR "encrypt"
        OR "encrypted"
        OR "encryption"
        OR "encryptions"
        )
    )

# Age Verification: Industry & Advocacy | including related child safety initiatives

"#voco"
OR "ageverificationsystems"
OR "childrenscode"
OR "digital economy act"
OR "harveyslaw"
OR "onlineageverification"
OR "pas1296"
OR "trackatroll"
OR "verification of children online"
OR <age appropriate design code>
OR <age assurance>
OR <age verification>

# Age Verification: General | because a basic search for the phrase yields very noisy results

"age verification"

# Anonymity: petition to require ID for social media ARCHIVE

* https://twitter.com/AlecMuffett/status/1370018001509097474
* https://twitter.com/AlecMuffett/status/1370091171461144579
* https://twitter.com/AlecMuffett/status/1414525963250110465
* https://www.huffingtonpost.co.uk/entry/katie-price-track-a-troll-petition-criticism_uk_604f2a25c5b60e0725f8e9aa
* https://www.openrightsgroup.org/blog/saveanonymity-together-we-can-defend-anonymity/

"#saveanonymity"
OR "#trackatroll"
OR (
    "https://petition.parliament.uk/petitions/575833"
    AND -"Make verified ID a requirement for opening" ## canned "share" phrase, reduces noise
    )
OR (
    ( <katie price> )
    AND "petition"
    )

# Hacking, Pegasus Project ARCHIVE

* https://thewire.in/government/project-pegasus-journalists-ministers-activists-phones-spying
* https://twitter.com/jsrailton/status/1416792857084583939
* https://www.amnesty.org/en/latest/research/2021/07/forensic-methodology-report-how-to-catch-nso-groups-pegasus/
* https://www.theguardian.com/news/series/pegasus-project

<nso group>
OR <pegasus project>
OR "israeli spyware"
OR ( "nso" AND "spyware")

# Apple: CSAM surveillance proposal | including #NeuralHash and #NeuralMatch and #ClientSideScanning

* https://9to5mac.com/2021/08/05/report-apple-photos-casm-content-scanning/
* https://twitter.com/matthew_d_green/status/1423071186616000513
* https://twitter.com/matthew_d_green/status/1423110719533371393
* https://twitter.com/matthew_d_green/status/1423407898890326021
* https://www.apple.com/child-safety/
* https://www.apple.com/child-safety/pdf/Apple_PSI_System_Security_Protocol_and_Analysis.pdf
* https://www.apple.com/child-safety/pdf/CSAM_Detection_Technical_Summary.pdf
* https://www.ft.com/content/14440f81-d405-452f-97e2-a81458f5411f
* https://www.vice.com/en/article/v7ejmy/apple-scan-message-content-nudity
* https://stratechery.com/2021/apples-mistake/
* https://daringfireball.net/2021/08/apple_child_safety_initiatives_slippery_slope
* https://www.eff.org/deeplinks/2021/08/if-you-build-it-they-will-come-apple-has-opened-backdoor-increased-surveillance
* https://www.theguardian.com/technology/2022/apr/20/apple-says-new-child-safety-feature-to-be-rolled-out-for-uk-iphones

<neural hash>
OR <neural match>
OR (
    (
        "apple"
        OR "iCloud"
        OR "iPhone"
        )
    AND (
        "csam"
        OR "cse"
        OR "ncmec"
        OR "psi"
        OR <child abuse>
        OR "illegal imagery"
        OR "law enforcement"
        OR "private set intersection"
	OR <client side>
	OR scanning
        )
    )
OR "https://www.apple.com/child-safety/"

# Anonymity: General

* https://www.eff.org/deeplinks/2011/08/randi-zuckerberg-runs-wrong-direction-pseudonymity
* https://www.penny-arcade.com/news/post/2013/02/18/the-corollary

"onlineAnonymity" OR
"onlinePseudonymity" OR
"internet fuckwad theory" OR
(
    (
        "abuse" OR
        "harm" OR
        "harms" OR
        "online" OR
        "onlineHarms"
        )
    AND (
        "anonymity" OR
        "anonymous" OR
        "pseudonymity" OR
        "pseudonymous"
        )
    ) OR
(
    "online" AND (
        "harms"
        OR "safety"
        )
    )

# Apple: Tank-Man Image

( "apple" OR "csam" )
AND (
    "tiananmen"
    OR "tienanmen"
    OR <tank man>
    OR <tank guy>
    )

# Childrens Code: "Regulation Works" Fallacy ARCHIVE

* https://twitter.com/AlecMuffett/status/1431575809907638273

"regulation works"
AND (
    "age appropriate"
    OR "child safety"
    OR "children"
    OR "children's code"
    OR "csam"
    OR "design code"
    OR "kidron"
    OR "online harms"
    OR "personal data"
    OR "platforms"
    )

# Age Verification: the UK @ChildrensComm ARCHIVE

* https://www.telegraph.co.uk/news/2021/08/30/social-media-companies-told-introduce-tough-age-checks-using/
* https://twitter.com/AlecMuffett/status/1401643033872023556
* https://twitter.com/neil_neilzone/status/1432243693008953346
* https://twitter.com/cyberleagle/status/1432243779998818305
* https://www.whatdotheyknow.com/request/evidence_underpinning_claim_that#incoming-1783612

"since:2021-08-30"
AND (
    "children's commissioner"
    OR "childrens commissioner"
    OR "childrenscomm"
    OR "rachel de souza"
    OR "rachel desouza"
    OR "rachel_desouza"
    )

# Apple: delay of CSAM surveillance of iPhones and MacOS

* "https://techcrunch.com/2021/09/04/apples-dangerous-path/"
* "https://www.bbc.co.uk/news/technology-58433647"
* "https://www.ft.com/content/5c17ca8b-da7c-4cd0-8f04-9ef82f608b25"
* "https://www.nytimes.com/2021/09/03/business/apple-child-safety.html"
* "https://www.theguardian.com/technology/2021/sep/03/apple-delays-plans-to-scan-cloud-uploads-for-child-sexual-abuse-images"
* "https://www.thorn.org/blog/thorn-statement-on-apples-pause-of-implementing-child-safety-measures/"

"since:2021-09-01"
AND (
    (
        "apple"
        AND ( "child" OR "csam" )
        AND (
            "delay"
            OR "delaying"
            OR "disappoint"
            OR "disappointed"
            OR "disappointing"
            OR "pause"
            OR "pauses"
            OR "postpone"
            OR "postpones"
            OR "reconsider"
            OR "reconsidering"
            OR "scan"
            OR "scanning"
            OR "surveillance"
            )
        )
    )

# ProPublica think that WhatsApp abuse reports are a backdoor ARCHIVE

* "https://twitter.com/AlecMuffett/status/1435277027725152256"
* "https://twitter.com/alexstamos/status/1435285445336715265"
* "https://twitter.com/evacide/status/1435287241383841798"
* "https://twitter.com/WABetaInfo/status/1435221936888483847"
* "https://appleinsider.com/articles/21/09/07/mark-zuckerberg-may-have-lied-to-congress-about-who-can-see-whatsapp-messages"
* "https://www.propublica.org/article/how-facebook-undermines-privacy-protections-for-its-2-billion-whatsapp-users"
* "https://www.dailymail.co.uk/news/article-9966435/Facebook-hired-1-000-workers-examine-millions-pieces-content-WhatsApp.html"
* "https://www.theregister.com/2021/09/07/whatsapp_privacy_propublica/"
* SEE ALSO: *PRESS COVERAGE* BELOW

"since:2021-09-06"
AND "whatsapp"
AND ( (
          "propublica"
          OR "end to end"
          OR "law enforcement"
          OR "moderating"
          OR "moderation"
          OR "moderator"
          OR "moderators"
          OR "privacy"
          OR "undermines"
          OR "undermining"
          )
    )

# ProPublica think that WhatsApp abuse reports are a backdoor, press coverage ARCHIVE

"https://appleinsider.com/articles/21/09/07/mark-zuckerberg-may-have-lied-to-congress-about-who-can-see-whatsapp-messages"
OR "https://www.propublica.org/article/how-facebook-undermines-privacy-protections-for-its-2-billion-whatsapp-users"
OR "https://www.dailymail.co.uk/news/article-9966435/Facebook-hired-1-000-workers-examine-millions-pieces-content-WhatsApp.html"
OR "https://www.theregister.com/2021/09/07/whatsapp_privacy_propublica/"

# CryptoWars21 UK Cressida Dick ARCHIVE

* https://www.telegraph.co.uk/news/2021/09/11/tech-giants-making-impossible-stop-terrorists-says-dame-cressida/
* https://www.bbc.co.uk/news/business-58537599

"since:2021-09-10"
AND (
    "https://www.telegraph.co.uk/news/2021/09/11/tech-giants-making-impossible-stop-terrorists-says-dame-cressida/"
    OR "https://www.bbc.co.uk/news/business-58537599"
    OR (
          <cressida dick>
          AND (
              "encrypted"
              OR "encryption"
              OR "terrorism"
              OR "terrorist"
              OR "terrorists"
              OR "tech giants"
              )
        )
    )

# End-to-End Encryption: European Union Backdoors | EU initiatives to mandate encryption backdoors

* https://alecmuffett.com/alecm/tmp/eu-csam-e2ee.pdf
* https://www.patrick-breyer.de/en/chat-control-eu-commission-presents-mass-surveillance-plan-on-may-11%EF%BF%BC/
* https://www.euractiv.com/section/data-protection/news/leak-commission-to-force-scanning-of-communications-to-combat-child-pornography/
* https://www.ifun.de/eu-will-chat-kontrolle-messenger-sollen-auf-csam-und-grooming-pruefen-186898/
* https://www.imore.com/leaked-eu-plans-mandate-scanning-encrypted-messages-stop-child-sexual-abuse
* https://www.berliner-zeitung.de/news/chatkontrolle-gesetz-das-steckt-hinter-den-umstrittenen-plaenen-der-eu-li.227198
* https://ec.europa.eu/commission/presscorner/detail/en/ip_22_2976 - documents are here
* https://www.heise.de/news/Chatkontrolle-EU-Kommission-bringt-Verordnung-fuer-Kinderporno-Scans-auf-den-Weg-7081975.html
* https://www.watson.ch/!517393392

"https://alecmuffett.com/alecm/tmp/eu-csam-e2ee.pdf"
OR "https://ec.europa.eu/commission/presscorner/detail/en/ip_22_2976"
OR (
    (
	"eu"
	OR "eu_commission"
	OR "european commission"
	OR "european union"
	)
    AND (
	"csam"
	OR "csei"
	OR "encrypted"
	OR "surveillance"
	OR "überwachung"
	OR <chat control>
	OR <chat kontrolle>
	OR <end to end encryption>
	)
    )

# Apple: "Bugs In Our Pockets" Paper

* https://arxiv.org/pdf/2110.07450.pdf [PDF]
* https://arxiv.org/abs/2110.07450
* https://www.lightbluetouchpaper.org/2021/10/15/bugs-in-our-pockets/
* https://www.nytimes.com/2021/10/14/business/apple-child-sex-abuse-cybersecurity.html
* https://www.theguardian.com/world/2021/oct/15/apple-plan-scan-child-abuse-images-tears-heart-of-privacy
* https://www.theregister.com/2021/10/15/clientside_side_scanning/
* https://elpais.com/tecnologia/2021-10-15/en-tu-movil-no-debe-entrar-nadie-un-grupo-global-de-expertos-pide-proteger-la-ultima-frontera-de-la-privacidad.html
* https://www.ft.com/content/64a74bde-4d64-4940-8c03-e01eeecc6e54
* https://nrkbeta.no/2021/10/15/ledende-eksperter-advarer-mot-a-skanne-mobiler-for-overgrepsmateriale/
* https://www.macrumors.com/2021/10/15/cybersecurity-experts-criticize-apple-csam/
* https://www.forbes.com/sites/emmawoollacott/2021/10/15/experts-slam-apples-child-protection-phone-scanning-technology/
* https://www.computerweekly.com/news/252508198/Apple-scheme-to-detect-child-abuse-creates-serious-privacy-and-security-risks-say-scientists
* https://www.schneier.com/blog/archives/2021/10/security-risks-of-client-side-scanning.html
* https://www.lawfareblog.com/law-and-policy-client-side-scanning
* https://www.lawfareblog.com/bugs-our-pockets-risks-client-side-scanning
* https://news.sky.com/story/technology-to-automatically-scan-all-iphones-threatens-democracy-researchers-warn-12434352

"since:2021-10-14"
AND (
    <bugs in our pockets>
    OR "auto-scans of phones would violate"
    OR "client side content scanning"
    OR "client side scanning"
    OR "ClientSideScanning"
    OR "cybersecurity experts sound alarm"
    OR "phone scanning"
    OR "tears at heart of privacy"
    OR "automatically scan all iphones"
    )

# Regulation: EU Digital Identity Framework

* https://blog.mozilla.org/netpolicy/2021/11/04/mozilla-publishes-position-paper-on-the-eu-digital-identity-framework/
* https://blog.mozilla.org/netpolicy/files/2021/11/eIDAS-Position-paper-Mozilla-.pdf [PDF]
* https://www.eff.org/deeplinks/2021/12/eus-digital-identity-framework-endangers-browser-security
* https://www.internetsociety.org/resources/doc/2021/internet-impact-brief-mandated-browser-root-certificates-in-the-eu-eidas-regulation/
* https://www.eff.org/deeplinks/2022/02/what-duck-why-eu-proposal-require-qwacs-will-hurt-internet-security

"#eIDAS"
OR "#EUeID"
OR "qualified web authentication"
OR <digital identity framework>
OR <eu digital id>
OR <eu digital identity>
OR ( ## these need to be constrained to reduce noise
    (
	"QWAC"
	OR "QWACs"
	)
    AND (
	"certificate"
	OR "certificates"
	OR "certs"
	)
    )

# End-To-End Encryption: Children | including #OnlineSafetyBill, and #NoPlaceToHide v1 & v2

* https://alecmuffett.com/article/15742
* https://alecmuffett.com/article/15891
* https://alecmuffett.com/article/15897
* https://alecmuffett.com/article/15902
* https://alecmuffett.com/article/15940
* https://twitter.com/AlecMuffett/status/1484512689112166403
* https://www.bbc.co.uk/news/technology-60072191
* https://www.rollingstone.com/culture/culture-news/revealed-uk-government-publicity-blitz-to-undermine-privacy-encryption-1285453/
* https://www.theguardian.com/technology/2022/jan/18/campaign-aims-to-stop-facebook-encryption-plans-over-child-abuse-fears
* https://www.theguardian.com/technology/2022/jan/21/end-to-end-encryption-protects-children-says-uk-information-watchdog
* https://www.theguardian.com/uk-news/2022/jan/22/nca-says-end-to-end-encryption-challenge-law-enforcers
* https://www.ft.com/content/ffb79368-daac-4bc3-80dd-dd24063579a7

"noPlaceToHide"
OR <online safety bill>
OR "OnlineSafetyCom" ## username
OR "LordsCommsCom" ## username
OR (
    ( ## audience keywords
	"child"
	OR "children"
	OR "kid"
	OR "kids"
	OR "parent"
	OR "parents"
	)
    AND (
	## medium-signal keywords
	( ## tuple
	    ( ## topic keywords
		"e2ee"
		OR "encrypt"
		OR "encrypted"
		OR "encrypting"
		OR "encryption"
		OR "endToEndEncryption"
		)
	    AND ( ## scope keywords
		"5rightsfound"
		OR "barnardos"
		OR "blackrock"
		OR "campaign"
		OR "facebook"
		OR "government"
		OR "ico"
		OR "instagram"
		OR "iwf"
		OR "mcfcharity"
		OR "messenger"
		OR "nspcc"
		OR "online"
		OR "ukhomeoffice"
		OR "vanguard"
		OR "whatsapp"
		)
	    )
	)
    )

# The "#WildWestWeb" Fallacy | for #SaferInternetDay, #SID2022, #PlayItSafeOnline, #EARNITAct and #NoPlaceToHide

* https://neilzone.co.uk/2022/01/the-wild-west-web-fallacy
* https://twitter.com/webdevlaw/status/1399318148776660996
* https://webdevlaw.uk/2019/07/18/tech-policy-is-no-place-for-hero-fantasies/
* https://webdevlaw.uk/2021/04/20/your-cut-and-keep-guide-to-the-unregulated-wild-west-internet/
* https://webdevlaw.uk/2022/02/07/the-wildwestweb-fallacy-isnt-about-ending-online-harms-its-about-enabling-populism/ **START HERE**
* https://www.nspcc.org.uk/globalassets/documents/news/taming-the-wild-west-web-regulate-social-networks.pdf
* https://www.nspcc.org.uk/globalassets/documents/research-reports/how-to-win-the-wild-west-web-report.pdf

(
    wildwestweb
    OR wildwestinternet
    OR wildwestnet
    OR (
	"wild west"
	AND (
	    "web"
	    OR "internet"
	    OR "network"
	    OR "nspcc"
	    OR "regulation"
	    OR "unregulated"
	    )
	)
    )
AND -"chance to make the UK the safest place"


# Safer Internet Day: General | tweets pertaining to the global campaign

"UK_SIC"
OR <play it fair online>
OR <safer internet day>
OR sid2022

# The EARN-IT Act & Section 230

* https://twitter.com/Riana_Crypto/status/1490152004668116993
* http://cyberlaw.stanford.edu/blog/2022/02/earn-it-act-back-and-it’s-more-dangerous-ever

"StopTheEarnItAct2022"
OR "StopEarnItAct2022"
OR <earn it act>
OR <section 230>

# The Balance Between ...

"balance between"
AND (
    "safety"
    OR "security"
    OR "privacy"
    OR "freedom"
    OR "freedoms"
    OR "rights"
    )

# Fake Rumours of Signal and WhatsApp Vulnerabilities

( "signalapp" OR "whatsapp" )
AND ( "attack" OR "attacks" )
AND "platform"

# The DMA and Messenger Interoperability

(
    "dma"
    OR <digital market>
    OR <digital markets>
    OR "data act"
    )
AND (
    "messenger"
    OR "encrypted"
    OR "encryption"
    OR "interop"
    OR "interoperability"
    OR "messaging"
    OR <app store>
    )

# July 2022 Reshuffle

"since:2022-07-04"
AND (
    reshuffle
    OR <andrew murrison>
    OR <dominic raab>
    OR <jacob rees mogg>
    OR <liz truss>
    OR <michael gove>
    OR <nadhim zahawi>
    OR <nadine dorries>
    OR <priti patel>
    OR <rishi sunak>
    OR <sajid javid>
    OR trussliz
    )

# Algorithmic Amplification

(
    algorithm
    OR algorithmic
    OR algorithmically
    OR algorithmicly
    OR algorithms
   )
AND (
    amplify
    OR <online safety bill>
    OR amplification
    OR promote
    OR promoted
    OR promotion
    OR viral
    OR virality
    )

# End To End Encryption: GCHQ & NCSC "Ghost" Protocol

* https://alecmuffett.com/alecm/e2e-primer/
* https://privacyinternational.org/news-analysis/3002/ghosts-your-machine-spooks-want-secret-access-encrypted-messages
* https://twitter.com/AlecMuffett/status/1533867745250623489
* https://twitter.com/josephfcox/status/1545036313228869632
* https://www.aclu.org/blog/privacy-technology/ghost-user-ploy-break-encryption-wont-work
* https://www.lawfareblog.com/exceptional-access-devil-details-0
* https://www.lawfareblog.com/principles-more-informed-exceptional-access-debate
* https://arxiv.org/abs/2207.09506

"https://arxiv.org/abs/2207.09506"
OR "https://www.lawfareblog.com/it-possible-reconcile-encryption-and-child-safety"
OR (
    ( ## actor
	"gchq"
	OR "crispin robinson"
	OR "ian levy"
	OR "ncsc"
	OR ( levy AND robinson )
	)
    AND ( ## interest
	<exceptional access> ## "ghost" is a noisy search term
	OR "commodity platforms"
	OR "end to end"
	OR "reconcile encryption"
	OR <child safety>
	OR backdoor
	OR e2e
	OR e2ee
	OR encrypted
	OR encryption
	)
    )

# End To End Encryption: GCHQ & NCSC "Ghost" Protocol: Press Coverage

* https://www.theguardian.com/uk-news/2022/jul/21/uk-cybersecurity-chiefs-back-plan-to-scan-phones-for-child-abuse-images
* https://www.thetimes.co.uk/article/spies-dispute-tech-firms-privacy-claims-ffq0bqsw0
* https://www.theregister.com/2022/07/22/british_encryption_scanning/
* https://news.sky.com/story/gchq-experts-set-out-how-to-tackle-online-child-sexual-abuse-despite-end-to-end-encryption-12655936

"https://www.theguardian.com/uk-news/2022/jul/21/uk-cybersecurity-chiefs-back-plan-to-scan-phones-for-child-abuse-images"
OR "https://news.sky.com/story/gchq-experts-set-out-how-to-tackle-online-child-sexual-abuse-despite-end-to-end-encryption-12655936"
OR "https://www.thetimes.co.uk/article/spies-dispute-tech-firms-privacy-claims-ffq0bqsw0"
OR "https://www.theregister.com/2022/07/22/british_encryption_scanning/"

# UK Internet Governance Forum: UKIGF

"ukigf"
OR "ukigf22"
OR (
    (
	<internet governance>
	OR "igf"
	OR "igfs"
	)
    AND (
	"splinternet"
	OR <digital inclusion>
	OR <digital inequality>
	OR <internet fragmentation>
	OR <online harms>
	OR <resilient internet>
	)
    )

# Digital Public Goods Alliance: DPGA

"dpga"
OR "dialcommunity"
OR "digitalundp"
OR "dpgalliance"
OR "dpgcharter"
OR <digital public good>
OR <digital public goods>
OR <information pollution>

# The California "Kids Code" | aka: "Age Appropriate Design Code", #AB2273

* https://blog.ericgoldman.org/archives/2022/06/will-california-eliminate-anonymous-web-browsing-comments-on-ca-ab-2273-the-age-appropriate-design-code-act.htm
* https://blog.ericgoldman.org/archives/2022/08/a-short-explainer-of-how-californias-age-appropriate-design-code-bill-ab2273-would-break-the-internet.htm
* https://blog.ericgoldman.org/archives/2022/08/op-ed-the-plan-to-blow-up-the-internet-ostensibly-to-protect-kids-online-regarding-ab-2273.htm
* https://blog.ericgoldman.org/archives/2022/09/an-interview-regarding-ab-2273-the-california-age-appropriate-design-code-aadc.htm
* https://www.techdirt.com/2022/06/29/california-legislators-seek-to-burn-down-the-internet-for-the-children/
* https://www.techdirt.com/2022/08/24/dear-california-law-makers-how-the-hell-can-i-comply-with-your-new-age-appropriate-design-code/
* https://www.techpolicy.com/Blog/Featured-Blog-Post/Eric-Goldman-Explains-How-Californias-Age-Appropri.aspx
* https://www.thedailybeast.com/californias-new-internet-law-is-a-fcking-disaster
* https://www.youtube.com/watch?v=Q-hwt5PU2Yc

<ab 2273>
OR <ab 02273>
OR <ca kids code>
OR "age appropriate design code"
OR "california design code"
OR "california kids code"
OR "california's design code"
OR "california's kids code"
OR "https://www.youtube.com/watch?v=Q-hwt5PU2Yc"
OR "https://californiaaadc.com"
