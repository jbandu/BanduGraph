// ============================================================================
// BanduGraph — Personal Knowledge Graph (Memgraph/Cypher)
// ============================================================================

// Core Person
MERGE (me:Person {
  userId: "jbandu",
  fullName: "Jayaprakash Bandu",
  aka: ["Jay","JP","J Bandu"],
  role: "SVP & Head, Mphasis - Retail, CPG, Travel & Transportation",
  basedIn: "Dallas, TX (often travels; currently in India Sep 2025)",
  family: {spouse: "Indhuja (Ramamurthy) Bandu", son: "Srihaan", daughter: true},
  notes: "25+ yrs at Mphasis; product- and AI-led transformation leader"
});

// Locations
MERGE (blore:Location {name:"Bengaluru, India"}) ON CREATE SET blore.type="City";
MERGE (dallas:Location {name:"Dallas, Texas, USA"}) ON CREATE SET dallas.type="City";
MERGE (apr:Location {name:"Adarsh Palm Retreat, Bengaluru"}) ON CREATE SET apr.type="Community";

// Orgs & Roles
MERGE (mph:Org {name:"Mphasis"}) ON CREATE SET mph.type="Company", mph.marketCapUSDApprox=6000000000, mph.revenueUSDApprox=1700000000;
MERGE (delta:Org {name:"Delta Air Lines"}) ON CREATE SET delta.type="Airline";
MERGE (united:Org {name:"United Airlines"}) ON CREATE SET united.type="Airline";
MERGE (costco:Org {name:"Costco"}) ON CREATE SET costco.type="Retail";
MERGE (rccl:Org {name:"Royal Caribbean Cruise Line"}) ON CREATE SET rccl.type="Cruise Line";

MERGE (me)-[:WORKS_AT {since: 2000}]->(mph);
MERGE (me)-[:HEADS]->(:Competency {name:"Travel & Hospitality", org:"Mphasis"});

// Businesses & Assets
MERGE (sbd:Business {name:"Sri Bandu Distributors"}) ON CREATE SET sbd.type="Shell Lubricants Distributor", sbd.city="Bengaluru", sbd.focus="Retail", sbd.awardWinning=true;
MERGE (pgEmpire:Asset {name:"Bengaluru Real Estate/PG Portfolio"}) ON CREATE SET pgEmpire.type="Real Estate", pgEmpire.estimatedValueINR="₹1000+ crores";
MERGE (house:Asset {name:"APR House"}) ON CREATE SET house.type="Residential", house.estimatedValueINR="₹60+ crores", house.location="Adarsh Palm Retreat";

MERGE (me)-[:OWNS]->(sbd);
MERGE (me)-[:OWNS]->(pgEmpire);
MERGE (me)-[:OWNS]->(house);
MERGE (sbd)-[:LOCATED_IN]->(blore);
MERGE (house)-[:LOCATED_IN]->(apr);

// Family
MERGE (spouse:Person {userId:"indhuja-ramamurthy", fullName:"Indhuja Ramamurthy (Bandu)"});
MERGE (son:Person {userId:"srihaan-bandu", fullName:"Srihaan Bandu"});

MERGE (me)-[:MARRIED_TO]->(spouse);
MERGE (me)-[:PARENT_OF]->(son);

// Awards
MERGE (awsAward:Award {name:"AWS Partner of the Year - Travel & Hospitality"}) ON CREATE SET awsAward.year=2024;
MERGE (lgAward:Award {name:"Ludicrous Growth Award"}) ON CREATE SET lgAward.year=2024;

MERGE (me)-[:TEAM_WON]->(awsAward);
MERGE (me)-[:WON]->(lgAward);

// Projects / Products
MERGE (projPSS:Project {name:"United Airlines — New PSS"}) ON CREATE SET projPSS.area="Airline Systems", projPSS.notes="IATA standards; integrate flight ops & MRO; replace legacy TPF";
MERGE (eawb:Project {name:"eawblink.org"}) ON CREATE SET eawb.area="Freight Forwarding", eawb.notes="SME eAWB creation";
MERGE (ensemble:Project {name:"Ensemble.AI Wardrobe & Travel Assistant"}) ON CREATE SET ensemble.area="Consumer App", ensemble.notes="Nordstrom-style UI, golf module planned";
MERGE (gamanam:Project {name:"Gamanam Travel Overlay"}) ON CREATE SET gamanam.area="Travel Memory/Overlay", gamanam.features=["calendar overlay","shareable link"];
MERGE (valayam:Project {name:"Valayam Life OS"}) ON CREATE SET valayam.area="Finance + Health", valayam.status="MVP planning";
MERGE (studyMyWay:Project {name:"StudyMyWay.com"}) ON CREATE SET studyMyWay.area="EdTech", studyMyWay.features=["smart study assistant","templates","forum","quiz"];
MERGE (sportGenie:Project {name:"SportGenie"}) ON CREATE SET sportGenie.area="E-commerce/Rec", sportGenie.features=["quiz","personalized recs"];
MERGE (stratosphere:Project {name:"Stratosphere Guard — Flight Planning System"}) ON CREATE SET stratosphere.area="Aviation/Dev", stratosphere.repo="github.com/jbandu/stratosphere-guard";

MERGE (me)-[:LEADS]->(projPSS);
MERGE (me)-[:BUILT]->(eawb);
MERGE (me)-[:BUILT]->(ensemble);
MERGE (me)-[:BUILT]->(gamanam);
MERGE (me)-[:PLANS]->(valayam);
MERGE (me)-[:BUILT]->(studyMyWay);
MERGE (me)-[:BUILT]->(sportGenie);
MERGE (me)-[:OWNS_CODE]->(stratosphere);

// Partnerships / Customers
MERGE (mph)-[:SIGNED_LOGO {period:"Apr 2024–Mar 2025"}]->(costco);
MERGE (mph)-[:SIGNED_LOGO {period:"Apr 2024–Mar 2025"}]->(rccl);

// Events / Travel
MERGE (alaskaCruise:Event {name:"Alaska Cruise"}) ON CREATE SET alaskaCruise.startDate="2025-08-01", alaskaCruise.status="planned", alaskaCruise.notes="Booked under spouse's old name";
MERGE (salesConf:Event {name:"Mphasis Annual Sales Conference — Atlanta"}) ON CREATE SET salesConf.date="2025-04-08", salesConf.topic="Wardrobe app gift";
MERGE (fireside:Event {name:"Fireside Chat with Mahesh Sogal (Delta)"}) ON CREATE SET fireside.date="2025-04-08", fireside.context="Sales conference";

MERGE (me)-[:ATTENDS]->(alaskaCruise);
MERGE (me)-[:HOSTED]->(fireside);

// Books / Writing
MERGE (bookFC:Book {title:"From Campus to Crore"}) ON CREATE SET bookFC.type="Nonfiction", bookFC.audience="Students";
MERGE (fpBook:Book {title:"Commercial Aviation Flight Planning — for Devs & Testers"}) ON CREATE SET fpBook.type="Technical", fpBook.mediums=["web","ebook"];

MERGE (me)-[:WRITES]->(bookFC);
MERGE (me)-[:WRITES]->(fpBook);

// Apps / Tools
MERGE (supabase:App {name:"Supabase"}) ON CREATE SET supabase.category="Backend";
MERGE (lovable:App {name:"Lovable.dev"}) ON CREATE SET lovable.category="Low-code";
MERGE (github:App {name:"GitHub"}) ON CREATE SET github.category="Dev";
MERGE (databricks:App {name:"Databricks"}) ON CREATE SET databricks.category="Data/ML";
MERGE (openai:App {name:"OpenAI"}) ON CREATE SET openai.category="AI";

MERGE (me)-[:USES]->(supabase);
MERGE (me)-[:USES]->(lovable);
MERGE (me)-[:USES]->(github);
MERGE (me)-[:USES]->(databricks);
MERGE (me)-[:USES]->(openai);

// Health (optional)
MERGE (diabetes:HealthCondition {name:"Diabetes"}) ON CREATE SET diabetes.type="Chronic";
MERGE (pancreatitis:HealthCondition {name:"Pancreatitis"}) ON CREATE SET pancreatitis.type="GI";
MERGE (xigduo:Medication {name:"Xigduo", dosage:"10/1000 mg", schedule:"once daily"});
MERGE (diet:Preference {key:"diet", value:"Non-vegetarian (no beef)"});

MERGE (me)-[:HAS_CONDITION]->(diabetes);
MERGE (me)-[:HAS_CONDITION]->(pancreatitis);
MERGE (me)-[:TAKES]->(xigduo);
MERGE (me)-[:HAS_PREFERENCE]->(diet);

// Preferences & Style
MERGE (prefStyle:Preference {key:"response_style", value:"Casual, helpful; avoid purple prose"});
MERGE (videoPref:Preference {key:"video_format", value:"Vertical (portrait)"});
MERGE (shopPref:Preference {key:"retail_preference", value:"Nordstrom"});

MERGE (me)-[:HAS_PREFERENCE]->(prefStyle);
MERGE (me)-[:HAS_PREFERENCE]->(videoPref);
MERGE (me)-[:HAS_PREFERENCE]->(shopPref);

// Community
MERGE (deca:Org {name:"DECA"}) ON CREATE SET deca.type="Education/Clubs";
MERGE (ftc:Org {name:"FIRST Tech Challenge"}) ON CREATE SET ftc.type="STEM/Robotics";

MERGE (me)-[:MENTORS]->(ftc);
MERGE (son)-[:COMPETES_IN]->(ftc);
MERGE (me)-[:SUPPORTS]->(deca);

// Facts
MERGE (fact1:Fact {name:"25+ years at Mphasis"}) ON CREATE SET fact1.year=2024;
MERGE (fact2:Fact {name:"Team won AWS Partner of the Year"}) ON CREATE SET fact2.date="2024-01-01";
MERGE (fact3:Fact {name:"Built eawblink.org"}) ON CREATE SET fact3.year=2025;

MERGE (me)-[:ACHIEVED]->(fact1);
MERGE (me)-[:ACHIEVED]->(fact2);
MERGE (me)-[:ACHIEVED]->(fact3);
