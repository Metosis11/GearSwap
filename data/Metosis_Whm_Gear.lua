-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')

	gear.obi_cure_waist = "Austerity Belt +1"
	gear.obi_cure_back = "Alaunus's Cape"

	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_nuke_back = "Toro Cape"

		-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')
	
	state.AutoSubMode = M(true, 'Auto Sub Mode')
	state.AutoSelfBuffMode = M(true, 'Auto SelfBuff Mode')
	state.Capacity = M(true, 'Capacity')	

    select_default_macro_book()
	lockstyleset()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="C. Palug Hammer",sub="Culminus"}
	sets.weapons.DualWeapons = {main="Izcalli",sub="Nehushtan"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast (80% cap) sets for spells: Total = 
    sets.precast.FC = {    
		main="C. Palug Hammer", --7
		sub="Chanter's Shield", --3
		ammo="Impatiens",
		head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, --10
		body="Inyanga Jubbah +2", --14
		hands="Gende. Gages +1", --7
		legs="Orvail Pants +1", --5
		feet="Regal Pumps +1", --7
		neck="Voltsurge Torque", --4
		waist="Witful Belt", --3
		left_ear="Loquac. Earring", --2
		right_ear="Malignance Earring", --4
		left_ring="Prolix Ring", --2
		right_ring="Lebeche Ring",
		back={name="Alaunus's Cape", augments={'"Fast Cast"+10',}}} --10
		-- Total = 78%
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons"}) --12

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {    
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}}, --15
		left_ear="Nourish. Earring +1", --4
		right_ear="Mendi. Earring"}) --5

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Precast sets to enhance JAs
	
    sets.precast.JA.Benediction = {body="Piety Briault +1"}
    sets.precast.JA.Devotion = {head="Piety Cap +1"}
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Nahtirah Hat",ear1="Roundel Earring",
		body="Piety Briault +1",hands="Telchine Gloves",
		waist="Chaac Belt",back="Aurist's Cape +1"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Kaykaus Bliaut",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Buquwik Cape",waist="Fotiar Belt",legs="Assid. Pants +1",feet="Gende. Galosh. +1"}
		
    sets.precast.WS.Dagan = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Etiolation Earring",ear2="Moonshade Earring",
		body="Kaykaus Bliaut",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Buquwik Cape",waist="Fotia Belt",legs="Assid. Pants +1",feet="Gende. Galosh. +1"}
		
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.MaxTP.Dagan = {ear1="Etiolation Earring",ear2="Evans Earring"}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {back="Umbra Cape"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {main=gear.grioavolr_fc_staff,sub="Umbra Strap",ammo="Hasty Pinion +1",
		head="Vanya Hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Gwati Earring",
		body="Vedic Coat",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Solemnity Cape",waist="Austerity Belt +1",legs="Vanya Slops",feet="Medium's Sabots"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {		
		main="C. Palug Hammer", --7
		sub="Chanter's Shield", --3
		ammo="Impatiens",
		head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, --10
		body="Inyanga Jubbah +2", --14
		hands="Gende. Gages +1", --7
		legs="Orvail Pants +1", --5
		feet="Regal Pumps +1", --7
		neck="Voltsurge Torque", --4
		waist="Witful Belt", --3
		left_ear="Loquac. Earring", --2
		right_ear="Malignance Earring", --4
		left_ring="Prolix Ring", --2
		right_ring="Lebeche Ring",
		back={name="Alaunus's Cape", augments={'"Fast Cast"+10',}}} 
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main="Queller Rod",sub="Sors Shield",ammo="Esper Stone +1",head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ros. Jaseran +1",hands={name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},legs="Ebers Pantaloons",
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},neck="Clr. Torque +1",waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",right_ear="Glorious Earring",left_ring="Stikini Ring +1",right_ring="Lebeche Ring",back="Mending Cape"}
		
	sets.midcast.CureSolace = {main="Queller Rod",sub="Sors Shield",ammo="Esper Stone +1",head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ros. Jaseran +1",hands={name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},legs="Ebers Pantaloons",
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},neck="Clr. Torque +1",waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",right_ear="Glorious Earring",left_ring="Stikini Ring +1",right_ring="Lebeche Ring",back="Mending Cape"}

	sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ebers Bliaud",hands={name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},legs="Ebers Pantaloons",
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},neck="Clr. Torque +1",waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",right_ear="Glorious Earring",left_ring="Stikini Ring +1",right_ring="Lebeche Ring",back={name="Alaunus's Cape", augments={'"Fast Cast"+10',}},}

	sets.midcast.LightWeatherCureSolace = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ebers Bliaud",hands={name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},legs="Ebers Pantaloons",
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},neck="Clr. Torque +1",waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",right_ear="Glorious Earring",left_ring="Stikini Ring +1",right_ring="Lebeche Ring",back={name="Alaunus's Cape", augments={'"Fast Cast"+10',}},}
		
	sets.midcast.LightDayCureSolace = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ebers Bliaud",hands={name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},legs="Ebers Pantaloons",
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},neck="Clr. Torque +1",waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",right_ear="Glorious Earring",left_ring="Stikini Ring +1",right_ring="Lebeche Ring",back={name="Alaunus's Cape", augments={'"Fast Cast"+10',}},}

	sets.midcast.LightDayCure = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ebers Bliaud",hands={name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},legs="Ebers Pantaloons",
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},neck="Clr. Torque +1",waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",right_ear="Glorious Earring",left_ring="Stikini Ring +1",right_ring="Lebeche Ring",back={name="Alaunus's Cape", augments={'"Fast Cast"+10',}},}

	sets.midcast.Curaga = {main="Queller Rod",sub="Sors Shield",ammo="Esper Stone +1",head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ros. Jaseran +1",hands={name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},legs="Ebers Pantaloons",
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},neck="Clr. Torque +1",waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",right_ear="Glorious Earring",left_ring="Stikini Ring +1",right_ring="Lebeche Ring",back="Mending Cape"}
		
	sets.midcast.LightWeatherCuraga = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ros. Jaseran +1",hands={name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},legs="Ebers Pantaloons",
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},neck="Clr. Torque +1",waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",right_ear="Glorious Earring",left_ring="Stikini Ring +1",right_ring="Lebeche Ring",back="Mending Cape"}
		
	sets.midcast.LightDayCuraga = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ros. Jaseran +1",hands={name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},legs="Ebers Pantaloons",
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},neck="Clr. Torque +1",waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",right_ear="Glorious Earring",left_ring="Stikini Ring +1",right_ring="Lebeche Ring",back="Mending Cape"}

	sets.midcast.Cure.DT = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",head={name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ebers Bliaud",hands={name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},legs="Ebers Pantaloons",
		feet={name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},neck="Clr. Torque +1",waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",right_ear="Glorious Earring",left_ring="Stikini Ring +1",right_ring="Lebeche Ring",back={name="Alaunus's Cape", augments={'"Fast Cast"+10',}},}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {ammo="Pemphredo Tathlum",
		head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Glorious Earring",
		body="Theo. Briault +2",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Luminary Sash",legs="Ebers Pantaloons",feet="Kaykaus Boots"}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {    
		main="Chatoyant Staff",
		sub="Clemency Grip",
		ammo="Hasty Pinion +1",
		head="Ebers Cap",
		body="Ebers Bliaud",
		hands="Fanatic Gloves",
		legs="Theo. Pant. +2",
		feet={name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		neck="Debilis Medallion",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Menelaus's Ring",
		right_ring="Haoma's Ring",
		back={name="Alaunus's Cape", augments={'"Fast Cast"+10',}},}

	sets.midcast.StatusRemoval = {    
		main="Chatoyant Staff",
		sub="Clemency Grip",
		ammo="Hasty Pinion +1",
		head="Ebers Cap",
		body="Piety Briault +1",
		hands="Piety Mitts +1",
		legs="Ebers Pantaloons",
		feet="Piety Duckbills +1",
		neck="Incanter's Torque",
		waist="Witful Belt",
		left_ear="Mendi. Earring",
		right_ear="Malignance Earring",
		left_ring="Prolix Ring",
		right_ring="Lebeche Ring",
		back={name="Mending Cape", augments={'Healing magic skill +9','Enha.mag. skill +10','Mag. Acc.+9','"Cure" potency +5%',}},}
		
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Cleric's Torque +2"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
		main="Beneficus",
		sub="Chanter's Shield",
		ammo="Hasty Pinion +1",
		head={name="Telchine Cap", augments={'Enh. Mag. eff. dur. +8',}},
		body={name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
		hands="Dynasty Mitts",
		legs="Piety Pantaln. +1",
		feet={name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +7',}},
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Lebeche Ring",
		back="Mending Cape",}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
	    main="Bolelabunga",
		head="Inyanga Tiara +2",
		body="Piety Briault +1",
		hands="Ebers Mitts",
		legs="Theo. Pant. +2",
		feet={name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +7',}},
		back={name="Alaunus's Cape", augments={'"Fast Cast"+10',}},})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.BarElement = {    
		main="Beneficus", --- must
		sub="Chanter's Shield",
		ammo="Hasty Pinion +1",
		head="Ebers Cap", 
		body="Ebers Bliaud",
		hands="Dynasty Mitts",
		legs="Piety Pantaln. +1",
		feet="Ebers Duckbills",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Lebeche Ring",
		back={name="Alaunus's Cape", augments={'"Fast Cast"+10',}},}

	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Twilight Cloak",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Witching Robe",hands=gear.chironic_enfeeble_hands,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist=gear.ElementalObi,legs="Chironic Hose",feet=gear.chironic_nuke_feet}

	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Crematio Earring",
		body="Witching Robe",hands=gear.chironic_enfeeble_hands,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

	sets.midcast['Divine Magic'] = {		
		main="Daybreak",
		sub="Chanter's Shield",
		ammo="Impatiens",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Inyan. Crackows +2",
		neck="Incanter's Torque",
		waist="Eschan Stone",
		left_ear="Nourish. Earring +1",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Inyanga Ring",
		back={name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10',}},}
		
	sets.midcast.Holy = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Buremte Hat",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Witching Robe",hands=gear.chironic_enfeeble_hands,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist=gear.ElementalObi,legs="Gyve Trousers",feet=gear.chironic_nuke_feet}

	sets.midcast['Dark Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Inyanga Jubbah +2",hands=gear.chironic_enfeeble_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        back="Aurist's Cape +1",waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Aurist's Cape +1",waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}

	sets.midcast.Stun.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Nahtirah Hat",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Dispel = {
		main="Daybreak",
		sub="Chanter's Shield",
		ammo="Impatiens",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		legs={name="Chironic Hose", augments={'Mag. Acc.+28','"Cure" potency +4%','MND+9','"Mag.Atk.Bns."+15',}},
		neck="Incanter's Torque",
		waist="Eschan Stone",
		left_ear="Nourish. Earring +1",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Inyanga Ring",
		back={name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10',}},}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast['Enfeebling Magic'] = {    
		main="Daybreak",
		sub="Chanter's Shield",
		ammo="Impatiens",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs={name="Chironic Hose", augments={'Mag. Acc.+28','"Cure" potency +4%','MND+9','"Mag.Atk.Bns."+15',}},
		feet="Inyan. Crackows +2",
		neck="Incanter's Torque",
		waist="Eschan Stone",
		left_ear="Nourish. Earring +1",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Inyanga Ring",
		back={name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10',}},}

	sets.midcast['Enfeebling Magic'].Resistant = {		
		main="Daybreak",
		sub="Chanter's Shield",
		ammo="Impatiens",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs={name="Chironic Hose", augments={'Mag. Acc.+28','"Cure" potency +4%','MND+9','"Mag.Atk.Bns."+15',}},
		feet="Inyan. Crackows +2",
		neck="Incanter's Torque",
		waist="Eschan Stone",
		left_ear="Nourish. Earring +1",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Inyanga Ring",
		back={name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10',}},}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {    
		main="Bolelabunga", sub="Culminus", ammo="Homiliary", head="Inyanga Tiara +2", body="Piety Briault +1", hands="Inyan. Dastanas +2", legs="Assid. Pants +1",
		feet="Inyan. Crackows +2", neck="Twilight Torque", waist="Embla Sash", left_ear="Infused Earring", right_ear="Eabani Earring", left_ring="Stikini Ring +1", 
		right_ring="Inyanga Ring", back={name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {    
		main="Bolelabunga",
		sub="Culminus",
		ammo="Homiliary",
		head="Inyanga Tiara +2",
		body="Piety Briault +1",
		hands="Inyan. Dastanas +2",
		legs="Assid. Pants +1",
		feet="Inyan. Crackows +2",
		neck="Twilight Torque",
		waist="Embla Sash",
		left_ear="Infused Earring",
		right_ear="Eabani Earring",
		left_ring="Stikini Ring +1",
		right_ring="Inyanga Ring",
		back={name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},}

	sets.idle.PDT = {main="Terra's Staff",sub="Mensch Strap +1", ammo="Staunch Tathlum", head="Inyanga Tiara +2", body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2", neck="Wiglen Gorget", waist="Embla Sash", left_ear="Infused Earring",	right_ear="Eabani Earring",
		left_ring={name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -6%',}}, right_ring="Defending Ring",
		back={name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},}
		
	sets.idle.MDT = {main="Terra's Staff",sub="Mensch Strap +1", ammo="Staunch Tathlum", head="Inyanga Tiara +2", body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2", neck="Twilight Torque", waist="Embla Sash", left_ear="Infused Earring", right_ear="Eabani Earring",
		left_ring={name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -6%',}}, right_ring="Defending Ring",
		back={name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},}
		
	sets.idle.Weak = {main="Terra's Staff",sub="Mensch Strap +1", ammo="Staunch Tathlum", head="Inyanga Tiara +2", body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2", neck="Wiglen Gorget", waist="Embla Sash", left_ear="Infused Earring",	right_ear="Eabani Earring",
		left_ring={name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -6%',}}, right_ring="Defending Ring",
		back={name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},}

    -- Defense sets

	sets.defense.PDT = {main="Terra's Staff",sub="Mensch Strap +1", ammo="Staunch Tathlum", head="Inyanga Tiara +2", body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2", neck="Wiglen Gorget", waist="Embla Sash", left_ear="Infused Earring",	right_ear="Eabani Earring",
		left_ring={name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -6%',}}, right_ring="Defending Ring",
		back={name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},}

	sets.defense.MDT = {main="Terra's Staff",sub="Mensch Strap +1", ammo="Staunch Tathlum", head="Inyanga Tiara +2", body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2", neck="Twilight Torque", waist="Embla Sash", left_ear="Infused Earring", right_ear="Eabani Earring",
		left_ring={name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -6%',}}, right_ring="Defending Ring",
		back={name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},}

    sets.defense.MEVA = {main="Terra's Staff",sub="Mensch Strap +1", ammo="Staunch Tathlum", head="Inyanga Tiara +2", body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2", neck="Wiglen Gorget", waist="Embla Sash", left_ear="Infused Earring",	right_ear="Eabani Earring",
		left_ring={name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -6%',}}, right_ring="Defending Ring",
		back={name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {    
		main="C. Palug Hammer",
		sub="Chanter's Shield",
		ammo="Hasty Pinion +1",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body={ name="Piety Briault +1", augments={'Enhances "Benediction" effect',}},
		hands={ name="Piety Mitts +1", augments={'Enhances "Martyr" effect',}},
		legs="Assid. Pants +1",
		feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
		neck="Lissome Necklace",
		waist="Embla Sash",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Petrov Ring",
		right_ring="Rajas Ring",
		back="Moonbeam Cape"
	}

    sets.engaged.Acc = {ammo="Hasty Pinion +1",
        head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back="Kayapa Cape",waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.engaged.DW = {ammo="Staunch Tathlum +1",
        head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}

    sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
        head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts",back="Mending Cape"}

	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}

	sets.HPCure = {main="Queller Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Blistering Sallet +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Alaunus's Cape",waist="Eschan Stone",legs="Ebers Pantaloons",feet="Kaykaus Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(3, 6)
end

function lockstyleset()
	send_command('wait 5;input /lockstyleset 18')
end

-------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ Job functions Overwrite ------------------------------------------------------------ 
-------------------------------------------------------------------------------------------------------------------------------------------------

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists[state.AutoBuffMode.Value]) do
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < spell_latency and silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) then
				windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end	
		end
		if state.AutoSelfBuffMode.value then
			if not buffactive['Auspice'] and spell_recasts[96] < latency and (player.target.type == "PLAYER" and player.target.distance < (8 + player.target.model_size)) 
				and not silent_check_silence() then
				windower.chat.input('/ma "Auspice" <me>')
				tickdelay = os.clock() + 2
				return true
			end	
		end	
	else
		return false
	end
end

function check_buffup()
	if buffup ~= '' then
		local needsbuff = false
		for i in pairs(buff_spell_lists[buffup]) do
			if not buffactive[buff_spell_lists[buffup][i].Buff] and silent_can_use(buff_spell_lists[buffup][i].SpellID) then
				needsbuff = true
				break
			end
		end
	
		if not needsbuff then
			add_to_chat(217, 'All '..buffup..' buffs are up!')
			buffup = ''
			return false
		end
		
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		for i in pairs(buff_spell_lists[buffup]) do
			if not buffactive[buff_spell_lists[buffup][i].Buff] and silent_can_use(buff_spell_lists[buffup][i].SpellID) and spell_recasts[buff_spell_lists[buffup][i].SpellID] < spell_latency then
				windower.chat.input('/ma "'..buff_spell_lists[buffup][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		
		return false
	else
		return false
	end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	When='Always'},
		{Name='Haste',			Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		When='Always'},	
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	When='Always'},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	When='Always'},		
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Always'},
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		When='OutOfCombat'},
		{Name='Blink',			Buff='Blink',		SpellID=53,		When='OutOfCombat'},			
	},
	Default = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen IV',		Buff='Regen',		SpellID=477,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	Reapply=false},
		{Name='Boost-MND',		Buff='MND Boost',	SpellID=484,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Barthundra',		Buff='Barthunder',	SpellID=70,		Reapply=false},
		{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
	},
	Melee = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},
	Melee = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},	
}


function check_sub()
	if state.AutoSubMode.value and not data.areas.cities:contains(world.area) then
		if player.mpp < 70 and player.tp > 999 then
			local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
			
			if available_ws:contains(190) then
				windower.chat.input('/ws Myrkr <me>')
				tickdelay = os.clock() + 1.5
				return true
			elseif available_ws:contains(173) then
				windower.chat.input('/ws Dagan <me>')
				tickdelay = os.clock() + 1.5
				return true
			end
		end
		if (player.main_job == 'SCH' or player.sub_job == 'SCH') then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[234] < latency then
				if buffactive['Sublimation: Complete'] then
					if player.mpp < 60 or (player.mpp < 90 and player.hpp < 50) then
						windower.chat.input('/ja Sublimation <me>')
						tickdelay = os.clock() + 1.5
						return true
					end
					
				elseif not buffactive['Sublimation: Activated'] and player.hpp > 60 and not buffactive['Refresh'] then
					windower.chat.input('/ja Sublimation <me>')
					tickdelay = os.clock() + 1.5
					return true
				end
			end
		end
	end
	return false
end

function job_customize_idle_set(idleSet)
    if buffactive['Sublimation: Activated'] then
        if (state.IdleMode.value == 'Normal' or state.IdleMode.value:contains('Sphere')) and sets.buff.Sublimation then
            idleSet = set_combine(idleSet, sets.buff.Sublimation)
        elseif state.IdleMode.value:contains('DT') and sets.buff.DTSublimation then
            idleSet = set_combine(idleSet, sets.buff.DTSublimation)
        end
    end

    if state.IdleMode.value == 'Normal' or state.IdleMode.value:contains('Sphere') then
		if player.mpp < 51 and not buffactive['Sublimation: Activated'] then
			if sets.latent_refresh then
				idleSet = set_combine(idleSet, sets.latent_refresh)
			end
			
			if (state.Weapons.value == 'None' or state.UnlockWeapons.value) and idleSet.main then
				local main_table = get_item_table(idleSet.main)

				if  main_table and main_table.skill == 12 and sets.latent_refresh_grip then
					idleSet = set_combine(idleSet, sets.latent_refresh_grip)
				end
				
				if player.tp > 10 and sets.TPEat then
					idleSet = set_combine(idleSet, sets.TPEat)
				end
			end
		end
   end
	
    return idleSet
end

