## questionnaire items from SPSS.sav

* caseid

* date

* [S3] 請問你住響邊區呢？
* [S4] 咁你係咪即係XXX【根據S3答案 (下面自動選擇)】 區既登記選民呢？【如對，按下題】如果唔係，咁你係屬於邊一區既登記選民呢？【讀出其他4個答案，改選另一答案】

* [LC1] 你知唔知今年有冇立法會選舉進行? (若被訪者答「知道」, 訪問員請追問: "咁係幾時舉行? "，如對方可答出於今年9月9日舉行 或 只能答出 "九月"，都歸納為 "答對")
* [LC2] 如果你支持既派別向選民發出一 d 配票指示，例如按照你既身分證號碼或者出生日期去選擇同一派別既不同名單，你會唔會照做？[all answers skip to Part C]

* [LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既經濟政策？
* [LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既政治訴求？
* [LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既民生政策？
* [LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既同中央政府既關係？
* [LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既知名度？
* [LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既係議會既資歷？

* [LC9-R1] 今年既立法會選舉將在9月9日舉行，請問你會唔會去投票？（訪問員追問程度）

* [LC10-R2] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？
* [LC11-R3] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？
* [LC11-R3] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？
* [LC12-R4] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？
* [LC13-R5] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？
* [LC14-R6] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* [LC15-R7] (問所有人) 請問你係唔係區議會(二) 功能界別，俗稱「超級區議會」既登記選民呢？
* [LC15-R7a] 咁你係唔係其他功能界別選民？
* [LC16-R8] 假如你可以係 黎緊既區議會(二) 功能界別，俗稱「超級區議會」選舉中投票，而此界別有以下名單參選，你傾向支持邊張名單呢？

* [LC21] (只問登記選民)請問你係舊年區議會選舉中有冇投票呢？
* [LC21a] 請問你係 2008 年立法會選舉中有冇投票呢？

* [LC22] 你係其他過往既各級議會選舉中有冇投過票？

* [LC23] 你認為自己既政治取向，係傾向認同邊一個派別呢?

* [DM1] 性別
* [DM2] 年齡 (準確數字）
* [DM2a] 【只問不肯透露準確年齡被訪者】請問您今年幾多歲呢? (範圍) [訪問員可讀出範圍]
* [DM3] 教育程度
* [DM4] 請問你住緊既單位係：
* [DM5] 咁係咩類型既房屋呢？
* [DM6] 職位
* [DM6b] 請問您每個月既個人收入大約係幾多呢? 請包括年終雙糧及花紅。
* [DM7] 你認為你既家庭屬於以下邊個階級?(讀出首五項答案)


## data dict. may be outdated -------------------------


* caseid

* date 			- this is rolling survey and hence the date of survey I supposed

* district 		- S3: where you live (19 districts) 
* 					  	[S3] 請問你住響邊區呢？

* district_vote - S4: which district you vote 
* 					  	[S4] 咁你係咪即係XXX【根據S3答案 (下面自動選擇)】 區既登記選民呢？【如對，按下題】如果唔係，咁你係屬於邊一區既登記選民呢？【讀出其他4個答案，改選另一答案】

* q7 			- LC1: know about LegCo 
*				       	[LC1] 你知唔知今年有冇立法會選舉進行? (若被訪者答「知道」, 訪問員請追問: "咁係幾時舉行? "，如對方可答出於今年9月9日舉行 或 只能答出 "九月"，都歸納為 "答對")
* q8 			- LC2: strategic voting
* 						[LC2] 如果你支持既派別向選民發出一 d 配票指示，例如按照你既身分證號碼或者出生日期去選擇同一派別既不同名單，你會唔會照做？[all answers skip to Part C]

* q9_1 			- LC3-8 ?1: economic policy
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既經濟政策？

* q9_2 			- LC3-8 ?2: political orientation
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既政治訴求？

* q9_3 			- LC3-8 ?3: livelihood policy 
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既民生政策？

* q9_4 			- LC3-8 ?4: Central Gov. relationship
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既同中央政府既關係？

* q9_5 			- LC3-8 ?5: famous
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既知名度？

* q9_6 			- LC3-8 ?6: experience as councillors 
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既係議會既資歷？

* R1			- LC9-R1   : will vote?
*					[LC9-R1] 今年既立法會選舉將在9月9日舉行，請問你會唔會去投票？（訪問員追問程度）

* R2			- LC10-R2  : which election list to support (HK Island)
*					[LC10-R2] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* R3			- LC11-R3  : -ditto- (Kowloon West)
*					[LC11-R3] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* R4			- LC12-R4  : -ditto- (Kowloon East)
*					[LC11-R4] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* R5			- LC13-R5  : -ditto- (NT West)
*					[LC11-R5] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* R6			- LC14-R6  : -ditto- (NT East)
*					[LC11-R6] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* R7			- LC15-R7  : "Super" District Council FC
*					[LC15-R7] (問所有人) 請問你係唔係區議會(二) 功能界別，俗稱「超級區議會」既登記選民呢？

* R7a			- LC15-R7a : "Super" DC registered voters?
*					[LC15-R7a] 咁你係唔係其他功能界別選民？

* R8 			- LC16-R8  : which election list to support ("Super" DC FC)
*					[LC16-R8] 假如你可以係 黎緊既區議會(二) 功能界別，俗稱「超級區議會」選舉中投票，而此界別有以下名單參選，你傾向支持邊張名單呢？

* v2a			- LC21  : vote last year district council ?
*					[LC21] (只問登記選民)請問你係舊年區議會選舉中有冇投票呢？

* v2			- LC21a : vote 2008 LegCo?
*					[LC21a] 請問你係 2008 年立法會選舉中有冇投票呢？

* v3			- LC22  : vote in any past district/regional/legco elections?
*					[LC22] 你係其他過往既各級議會選舉中有冇投過票？

* v4 			- LC23  : political orientation
*					[LC23] 你認為自己既政治取向，係傾向認同邊一個派別呢?

* sex 			- DM1  : (more female; have to check with the 
*					[DM1] 性別
							-hk population and 
							- voter register stat.?)
* age1			- DM2  : exact age at the time of survey 
*					[DM2] 年齡 (準確數字）
							- (it change :-)
							- (see below for the age1recode) 
* age2 			- DM2a : not answering exact age (16.9% not telling)
*					[DM2a] 【只問不肯透露準確年齡被訪者】請問您今年幾多歲呢? (範圍) [訪問員可讀出範圍]
							- not sure why there is DM2c 20-24 and DM2b 30-34
* edu 			- DM3  : 
*					[DM3] 教育程度

* type 			- DM4  : self-own or rent
*					[DM4] 請問你住緊既單位係：

* housing 		- DM5  : type of housing
*					[DM5] 咁係咩類型既房屋呢？

* occ 			- DM6  : occupation type 
*					[DM6] 職位
							- (can have weight if align with census ...)
* income 		- DM6b : personal monthly income
*					[DM6b] 請問您每個月既個人收入大約係幾多呢? 請包括年終雙糧及花紅。

* mid			- DM7  : class !!!
*					[DM7] 你認為你既家庭屬於以下邊個階級?(讀出首五項答案)

* age5num, age5str - recode age1 and age2 together to a new var 
*				(num is numeric and str is string format) to 1-5, 6-10 etc.
                   