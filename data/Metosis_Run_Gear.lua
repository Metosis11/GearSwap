function user_job_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT_HP','PDT')
	state.MagicalDefenseMode:options('MDT_HP','BDT_HP','MDT','BDT')
	state.ResistDefenseMode:options('MEVA_HP','MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('None','Aettir','Lycurgos','HepatizonAxe', 'Naegling')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = {name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.fc_sird_jse_back = {name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
	gear.tp_jse_back = {name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	
	gear.taeon_phalanx_feet = {name="Taeon Boots", augments={'Spell interruption rate down -10%','Phalanx +3',}}
	gear.taeon_phalanx_body = {name="Taeon Tabard", augments={'Spell interruption rate down -10%','Phalanx +3',}}
	--gear.taeon_phalanx_feet = {name="Taeon Boots", augments={'Spell interruption rate down -10%','Phalanx +3',}}
	--gear.taeon_phalanx_feet = {name="Taeon Boots", augments={'Spell interruption rate down -10%','Phalanx +3',}}
	--gear.taeon_phalanx_feet = {name="Taeon Boots", augments={'Spell interruption rate down -10%','Phalanx +3',}}
	
	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	--send_command('bind !g gs c weapons Lionheart;gs c update')
	
	state.AutoTrustMode = M(true, 'Auto Trust Mode')
	state.AutoFoodMode = M(true, 'Auto Food Mode')
	state.AutoRuneMode = M(true, 'Auto Rune Mode')
	state.AutoBuffMode 	= M{['description'] = 'Auto Buff Mode','Auto','Off'}	
	
	autows = 'Dimidiation'
	autofood = 'Fried Popoto'
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {   
			main={name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Halitus Helm",
			body="Emet Harness +1",
			hands="Futhark Mitons +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Unmoving Collar",
			waist="Kasiri Belt",
			left_ear="Friomisi Earring",
			right_ear="Tuisto Earring",
			left_ring="Petrov Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
	sets.Enmity.DT = set_combine(sets.Enmity,{left_ear="Eabani Earring", left_ring="Dark Ring",})		
	sets.Enmity.SIRD = {    
			main={name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Halitus Helm",
			body=gear.taeon_phalanx_body,
			hands="Rawhide Gloves",
			legs="Carmine Cuisses +1",
			feet=gear.taeon_phalanx_feet,
			neck="Unmoving Collar",
			waist="Audumbla Sash",
			left_ear="Friomisi Earring",
			right_ear="Tuisto Earring",
			left_ring="Evanescence Ring",
			right_ring="Defending Ring",
			back=gear.fc_sird_jse_back,}
	sets.Enmity.SIRDT = set_combine(sets.Enmity.DT,{hands="Rawhide Gloves", waist="Audumbla Sash",})

		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist Coat +1",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist Mitons +1"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist Coat +1", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist Mitons +1"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {    
			main="Naegling",
			head={name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic dmg. taken -1%','MND+4','Mag. Acc.+14','"Mag.Atk.Bns."+8',}},
			body={name="Rawhide Vest", augments={'DEX+10','STR+7','INT+7',}},
			hands={name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
			legs={name="Herculean Trousers", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +4%','STR+7','Mag. Acc.+1',}},
			feet={name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','AGI+9','Accuracy+13','Attack+7',}},
			neck="Sanctity Necklace",
			waist="Eschan Stone",
			left_ear="Friomisi Earring",
			right_ear="Tuisto Earring",
			left_ring="Arvina Ringlet +1",
			right_ring="Acumen Ring",
			back="Evasionist's Cape",}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",ring1="Stikini Ring +1",ring2="Stikini Ring +1",legs="Rune. Trousers +1"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells -- 52% gears + 30% merits = +80% Total FC
    sets.precast.FC = {    
			ammo="Impatiens",
			head={name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, 							-- 14%
			body={name="Taeon Tabard", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','"Fast Cast"+5','"Regen" potency+3',}}, 	-- 9%
			hands={name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20',}},
			legs="Aya. Cosciales +2", 																							-- 6%
			feet={name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},								-- 8%
			neck="Voltsurge Torque",																							-- 4%
			waist="Audumbla Sash",
			left_ear="Loquac. Earring", 																						-- 2%
			right_ear="Tuisto Earring",
			left_ring="Prolix Ring",																							-- 2%	
			right_ring="Lebeche Ring",
			back=gear.fc_sird_jse_back} 																						-- 10%

	-- Fast cast sets for spells -- 50% gears + 30% merits = 80% Total FC
	sets.precast.FC.DT = {
			ammo="Impatiens",
			head={name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, 							-- 14%
			body={name="Taeon Tabard", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','"Fast Cast"+5','"Regen" potency+3',}}, 	-- 8%
			hands={name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20',}},
			legs="Aya. Cosciales +2", 																							-- 6%
			feet={name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},								-- 8%
			neck="Voltsurge Torque",																							-- 4%
			waist="Audumbla Sash",
			left_ear="Eabani Earring", 																							
			right_ear="Tuisto Earring",
			left_ring="Lebeche Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape"} 																			
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga Beads'})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {    
			ammo="Hasty Pinion +1",
			head={name="Herculean Helm", augments={'Accuracy+20 Attack+20','Weapon skill damage +3%','Attack+9',}},
			body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			legs={name="Herculean Trousers", augments={'Accuracy+9 Attack+9','Weapon skill damage +5%','STR+2','Accuracy+12','Attack+14',}},
			feet="Meg. Jam. +2",
			neck="Caro Necklace",
			waist="Grunfeld Rope",
			left_ear="Ishvara Earring",
			right_ear={name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			left_ring="Rajas Ring",
			right_ring="Apate Ring",
			back=gear.tp_jse_back}
			
	sets.precast.WS.SomeAcc = {ammo="Voluspa Tathlum",
            head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.Acc = {ammo="C. Palug Stone",
            head="Dampening Tam",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.HighAcc = {ammo="C. Palug Stone",
            head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}
	sets.precast.WS.FullAcc = {ammo="C. Palug Stone",
            head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Mache Earring +1",
            body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
            back=gear.tp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}

    sets.precast.WS['Resolution'] = {    
			ammo="Hasty Pinion +1",
			head="Adhemar Bonnet +1",
			body="Adhemar Jacket +1",
			hands="Adhemar Wrist. +1",
			legs={name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','AGI+9','Accuracy+13','Attack+7',}},
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Ishvara Earring",
			right_ear={name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			left_ring="Apate Ring",
			right_ring="Rufescent Ring",
			back=gear.tp_jse_back}
			
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{legs="Lustr. Subligar +1",feet="Lustra. Leggings +1",})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Fell Cleave'] = set_combine(sets.precast.WS['Resolution'],{})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {    
			ammo="Staunch Tathlum",
			head={name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			body=gear.taeon_phalanx_body,
			hands={name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20',}},
			legs="Aya. Cosciales +2",
			feet={name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
			neck="Voltsurge Torque",
			waist="Audumbla Sash",
			left_ear="Loquac. Earring",
			right_ear="Tuisto Earring",
			left_ring="Evanescence Ring",
			right_ring="Prolix Ring",
			back=gear.fc_sird_jse_back,}
			
	sets.midcast.FastRecast.DT = set_combine(sets.midcast['FastRecast'],{
			head="Meghanada Visor +2",
			neck="Twilight Torque",
			left_ear="Eabani Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back})

		-- 90% Spell Interruption
	sets.midcast.FastRecast.SIRD = set_combine(sets.midcast.FastRecast,{
			ammo="Staunch Tathlum", 																		-- 10%
			body=gear.taeon_phalanx_body,																	-- 10%
			hands="Rawhide Gloves",																			-- 15%	
			legs="Carmine Cuisses +1",               														-- 20%
			feet=gear.taeon_phalanx_feet,																	-- 10%			
			waist="Audumbla Sash",																			-- 10%
			left_ring="Evanescence Ring",																	-- 5%
			back=gear.fc_sird_jse_back,})																	-- 10%
			
	sets.midcast.FastRecast.SIRDT = set_combine(sets.midcast.FastRecast.DT,{
			ammo="Staunch Tathlum",
			body=gear.taeon_phalanx_body,
			hands="Rawhide Gloves",
			legs="Carmine Cuisses +1",
			waist="Audumbla Sash",
			left_ring="Evanescence Ring",
			back=gear.fc_sird_jse_back,})			

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
			head="Carmine Mask +1",
			hands="Runeist Mitons +1",
			legs="Carmine Cuisses +1",
			neck="Incanter's Torque",
			left_ear="Mimir Earring",
			left_ring="Stikini Ring +1",})

    sets.midcast['Enhancing Magic'].DT = set_combine(sets.midcast.FastRecast.DT,{
			head="Carmine Mask +1",
			hands="Runeist Mitons +1",
			legs="Carmine Cuisses +1",
			})
		
    sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast.FastRecast.SIRD,{
			head="Carmine Mask +1",
			neck="Incanter's Torque",
			left_ear="Mimir Earring",
			right_ring="Stikini Ring +1",})				
			
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
			ammo="Staunch Tathlum",
			head={name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
			body=gear.taeon_phalanx_body,
			hands={name="Taeon Gloves", augments={'Spell interruption rate down -10%','Phalanx +3',}},
			legs={name="Taeon Tights", augments={'Spell interruption rate down -10%','Phalanx +3',}},
			feet=gear.taeon_phalanx_feet,
			waist="Audumbla Sash",
			right_ear="Tuisto Earring",
			right_ring="Defending Ring",
			back=gear.fc_sird_jse_back,})
	sets.midcast['Phalanx'].DT = set_combine(sets.midcast['Phalanx'],{})
	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'].DT,{   
			head="Rune. Bandeau +1",
			body={name="Taeon Tabard", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','"Fast Cast"+5','"Regen" potency+3',}},
			hands="Rawhide Gloves",
			legs="Futhark Trousers +1",
			feet={name="Taeon Boots", augments={'"Conserve MP"+5','"Regen" potency+3',}},})
	sets.midcast['Regen'].DT = set_combine(sets.midcast['Regen'],{})			
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'].DT,{head="Erilaz Galea +1", hands="Rawhide Gloves", legs="Futhark Trousers +1"})
	sets.midcast['Refresh'].DT = set_combine(sets.midcast['Refresh'],{waist="Gishdubar Sash"})
	sets.midcast['Aquaveil'] = set_combine(sets.midcast.FastRecast.SIRD,{})
	sets.midcast['Aquaveil'].DT = set_combine(sets.midcast.FastRecast.SIRDT,{feet=gear.taeon_phalanx_feet})
	sets.midcast['BarStatus'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1", legs="Futhark Trousers +1"})
	sets.midcast['BarStatus'].DT = set_combine(sets.midcast['Enhancing Magic'].DT,{head="Erilaz Galea +1", legs="Futhark Trousers +1"})	
	sets.midcast['Stoneskin'] = set_combine(sets.midcast.FastRecast.SIRD,{head="Erilaz Galea +1",legs="Futhark Trousers +1",waist="Siegel Sash"})
	sets.midcast['Stoneskin'].DT = set_combine(sets.midcast.FastRecast.SIRDT,{head="Erilaz Galea +1",legs="Futhark Trousers +1",waist="Siegel Sash"})	
	sets.midcast['Blink'] = set_combine(sets.midcast['Enhancing Magic'].DT, {head="Erilaz Galea +1", hands="Rawhide Gloves"})	
	sets.midcast['Spikes'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1", legs="Futhark Trousers +1"})
	sets.midcast['Spikes'].DT = set_combine(sets.midcast['Enhancing Magic'].DT,{head="Erilaz Galea +1", legs="Futhark Trousers +1"})	
	
	sets.midcast['Crusade'] = set_combine(sets.midcast['Enhancing Magic'].DT,{head="Erilaz Galea +1", hands="Rawhide Gloves", legs="Futhark Trousers +1"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",neck="Sacro Gorget",ear1="Mendi. Earring",ear2="Roundel Earring",
        body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	sets.Phalanx_Received = {main="Deacon Sword"}
	
    sets.midcast['Protect'] = set_combine(sets.midcast['Enhancing Magic'].DT, {head="Erilaz Galea +1", hands="Rawhide Gloves", legs="Futhark Trousers +1", left_ring="Sheltered Ring"})
    sets.midcast['Shell'] = set_combine(sets.midcast['Enhancing Magic'].DT, {head="Erilaz Galea +1", hands="Rawhide Gloves", legs="Futhark Trousers +1", left_ring="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {    
			main="Ushenzi",
			sub="Mensch Strap +1",
			ammo="Homiliary",
			head="Rawhide Mask",
			body="Runeist Coat +1",
			hands="Meg. Gloves +2",
			legs={name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
			feet="Meg. Jam. +2",
			neck="Bathy Choker +1",
			waist="Audumbla Sash",
			left_ear="Dawn Earring",
			right_ear="Infused Earring",
			left_ring="Meghanada Ring",
			right_ring="Stikini Ring +1",
			back="Moonbeam Cape",}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",}

	sets.idle.KiteTank = {    
			main="Aettir",
			sub="Mensch Strap +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			legs="Carmine Cuisses +1",
			feet="Hippo. Socks +1",
			neck="Wiglen Gorget",
			waist="Kentarch Belt +1",
			left_ear="Eabani Earring",
			right_ear="Infused Earring",
			left_ring="Meghanada Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}

	sets.idle.Weak = {main="Aettir",sub="Utu Grip",ammo="Homiliary",
		head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet=gear.herculean_refresh_feet}

	sets.Kiting = {legs="Carmine Cuisses +1", feet="Hippo. Socks +1",}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",body="Erilaz Surcoat +1",waist="Flume Belt +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Aettir = {main="Aettir",sub="Refined Grip +1"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	sets.weapons.Lycurgos = {main="Lycurgos",sub="Mensch Strap +1"}	
	sets.weapons.HepatizonAxe = {main="Hepatizon Axe",sub="Refined Grip +1"}
	sets.weapons.Naegling = {main="Naegling"}
	
	-- Defense Sets
	
	sets.defense.PDT = {			
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
	
	sets.defense.PDT_HP = {			
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
	
	sets.defense.MDT = {
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
	
	sets.defense.MDT_HP = {
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
	
	sets.defense.BDT = {
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
	
	sets.defense.BDT_HP = {
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
	
	sets.defense.MEVA = {			
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
	
	sets.defense.MEVA_HP = {
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
		
	sets.defense.Death = {
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}

	sets.defense.DTCharm = {			
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
		
	sets.defense.Charm = {
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {  
			sub="Mensch Strap +1",
			ammo="Ginsen",
			head="Adhemar Bonnet +1",
			body="Adhemar Jacket +1",
			hands="Adhemar Wrist. +1",
			legs={name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','AGI+9','Accuracy+13','Attack+7',}},
			neck="Lissome Necklace",
			waist="Kentarch Belt +1",
			left_ear="Brutal Earring",
			right_ear="Cessance Earring",
			left_ring="Epona's Ring",
			right_ring="Petrov Ring",
			back=gear.tp_jse_back}
   
   sets.engaged.SomeAcc = {main="Lionheart",sub="Utu Grip",ammo="Yamarang",
            head="Dampening Tam",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
            back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
	sets.engaged.Acc = {main="Lionheart",sub="Utu Grip",ammo="Yamarang",
            head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
            back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.engaged.HighAcc = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
            head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
            back=gear.tp_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}
	sets.engaged.FullAcc = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
            head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Mache Earring +1",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
            back=gear.tp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}
  
  sets.engaged.DTLite = {    
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Aya. Zucchetto +2",
			body="Ayanmo Corazza +2",
			hands="Adhemar Wrist. +1",
			legs="Meg. Chausses +2",
			feet={name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','AGI+9','Accuracy+13','Attack+7',}},
			neck="Twilight Torque",
			waist="Sailfi Belt +1",
			left_ear="Cessance Earring",
			right_ear="Brutal Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
    
	sets.engaged.SomeAcc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	sets.engaged.Acc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",ammo="C. Palug Stone",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	sets.engaged.HighAcc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	sets.engaged.FullAcc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Mache Earring +1",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
   
   sets.engaged.Tank = {
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
			
	sets.engaged.Tank_HP = {
			main="Aettir",
			sub="Refined Grip +1",
			ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Runeist Coat +1",
			hands="Erilaz Gauntlets +1",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Twilight Torque",
			waist="Audumbla Sash",
			left_ear="Eabani Earring",
			right_ear="Tuisto Earring",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back=gear.enmity_jse_back}
    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {hands="Turms Mittens +1"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'SCH' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 9)
	else
		set_macro_page(1, 9)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Arciela") then
					windower.send_command('input /ma "Arciela" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Joachim") then
					windower.send_command('input /ma "Joachim" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function user_job_lockstyle()
	if state.Weapons.value == 'Aettir' then
		windower.chat.input('/lockstyleset 16')
	else
		windower.chat.input('/lockstyleset 16')
	end
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------- Job functions Overwrite --------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function check_rune()
	if state.AutoRuneMode.value and (player.main_job == 'RUN' or player.sub_job == 'RUN') and not data.areas.cities:contains(world.area) then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.main_job == 'RUN' and (not buffactive[state.RuneElement.value] or buffactive[state.RuneElement.value] < 3) then
			if abil_recasts[92] > 0 then return false end		
			windower.chat.input('/ja "'..state.RuneElement.value..'" <me>')
			tickdelay = os.clock() + 1.8
			return true

		elseif not buffactive[state.RuneElement.value] or buffactive[state.RuneElement.value] < 2 then
			if abil_recasts[92] > 0 then return false end		
			windower.chat.input('/ja "'..state.RuneElement.value..'" <me>')
			tickdelay = os.clock() + 1.8
			return true

		elseif player.main_job == 'RUN' and abil_recasts[242] < latency and ((player.hpp < 60 or (state.RuneElement.Value == 'Tenebrae' and player.mpp < 75)) 
			or buffactive.paralysis or buffactive.curse or buffactive.mute or buffactive.bane or buffactive.virus or buffactive.plague or buffactive.doom) then
			windower.chat.input('/ja "Vivacious Pulse" <me>')
			tickdelay = os.clock() + 1.8
			return true
			
		elseif not player.in_combat then
			return false
			
		--elseif not buffactive['Pflug'] and abil_recasts[59] < latency then
			--windower.chat.input('/ja "Pflug" <me>')
			--tickdelay = os.clock() + 1.8
			--return true
		elseif player.main_job == 'RUN' then
			if not (state.Buff['Vallation'] or state.Buff['Valiance']) then
				if abil_recasts[113] < latency then
					windower.chat.input('/ja "Valiance" <me>')
					tickdelay = os.clock() + 2.5
					return true
				elseif abil_recasts[23] < latency then
					windower.chat.input('/ja "Vallation" <me>')
					tickdelay = os.clock() + 2.5
					return true
				end
			end
		elseif not (buffactive['Vallation'] or buffactive['Valiance']) then
			if abil_recasts[23] < latency then
				windower.chat.input('/ja "Vallation" <me>')
				tickdelay = os.clock() + 2.5
				return true
			end
		end
	end
	return false
end

function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'subjobenmity' then

		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
			return
	
		elseif player.sub_job == 'BLU' then
			local spell_recasts = windower.ffxi.get_spell_recasts()
					
			if spell_recasts[584] < spell_latency then
				windower.chat.input('/ma "Sheep Song" <t>')
			elseif spell_recasts[598] < spell_latency then
				windower.chat.input('/ma "Soporific" <t>')
			elseif spell_recasts[605] < spell_latency then
				windower.chat.input('/ma "Geist Wall" <t>')
			elseif spell_recasts[575] < spell_latency then
				windower.chat.input('/ma "Jettatura" <t>')
			elseif spell_recasts[537] < spell_latency then
				windower.chat.input('/ma "Stinking Gas" <t>')
			elseif spell_recasts[592] < spell_latency then
				windower.chat.input('/ma "Blank Gaze" <t>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Blue Magic on cooldown.') end
			end
			
		elseif player.sub_job == 'DRK' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local spell_recasts = windower.ffxi.get_spell_recasts()
			
			if buffactive['Souleater'] then
				send_command('cancel souleater')
			end
			
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None') and buffactive['Last Resort'] then
				send_command('cancel last resort')
			end
			
			if spell_recasts[252] < spell_latency and not silent_check_silence() then
				windower.chat.input('/ma "Stun" <t>')
			elseif abil_recasts[85] < latency then
				windower.chat.input('/ja "Souleater" <me>')
			elseif abil_recasts[87] < latency then
				windower.chat.input('/ja "Last Resort" <me>')
			elseif abil_recasts[88] < latency then
				windower.chat.input('/ja "Weapon Bash" <t>')
			elseif abil_recasts[86] < latency then
				windower.chat.input('/ja "Arcane Circle" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Dark Knight abillities on cooldown.') end
			end

		elseif player.sub_job == 'WAR' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None')  and buffactive['Berserk'] then
				send_command('cancel berserk')
			end
			
			if abil_recasts[5] < latency then
				windower.chat.input('/ja "Provoke" <t>')
			elseif abil_recasts[2] < latency then
				windower.chat.input('/ja "Warcry" <me>')
			elseif abil_recasts[3] < latency then
				windower.chat.input('/ja "Defender" <me>')
			elseif abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
			elseif abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Warrior Job Abilities on cooldown.') end
			end
			
		elseif player.sub_job == 'DNC' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
			if under3FMs then
				if abil_recasts[220] < latency then
				send_command('@input /ja "'..state.Steps.value..'" <t>')
				return
				end
			elseif abil_recasts[221] < latency then
				windower.chat.input('/ja "Animated Flourish" <t>')
				return
			elseif abil_recasts[220] < latency and not buffactive['Finishing Move 5'] then
				send_command('@input /ja "'..state.Steps.value..'" <t>')
				return
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'Dancer job abilities not needed.') end
			end
		end
	end
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists[state.AutoBuffMode.Value]) do
			
		if not buffactive['Refresh'] and spell_recasts[109] < latency and (player.mpp < 60 and (player.in_combat or being_attacked)) and not silent_check_silence() then
				windower.chat.input('/ma "Refresh" <me>')
				tickdelay = os.clock() + 3
				return true
			elseif not buffactive['Refresh'] and spell_recasts[109] < latency and (player.mpp < 80 and not (player.in_combat or being_attacked)) and not silent_check_silence() then
				windower.chat.input('/ma "Refresh" <me>')
				tickdelay = os.clock() + 3
				return true
			end		
			
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < spell_latency and silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) then
				windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		
			if not buffactive['Regen'] and spell_recasts[108] < latency and (player.hpp < 80) then
				windower.chat.input('/ma "Regen IV" <me>')
				tickdelay = os.clock() + 3
				return true
			end
			
				if not buffactive['Foil'] and spell_recasts[840] < latency and (player.in_combat and being_attacked) then
				windower.chat.input('/ma "Foil" <me>')
				tickdelay = os.clock() + 2
				return true
			end
			
		if player.in_combat and player.status == 'Engaged' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if buffactive['Souleater'] then
				send_command('cancel souleater')
			end
			
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None') and buffactive['Last Resort'] then
				send_command('cancel last resort')
			end	
			
			if not buffactive['Swordplay'] and abil_recasts[24] < latency then
				windower.chat.input('/ja "Swordplay" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif player.sub_job == 'DRK' and not buffactive['Last Resort'] and abil_recasts[87] < latency then
				windower.chat.input('/ja "Last Resort" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif player.sub_job == 'WAR' and not buffactive.Berserk and abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif player.sub_job == 'WAR' and not buffactive.Aggressor and abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
				tickdelay = os.clock() + 1.1
				return true
			else
				return false
			end
		end
	end
		
	return false
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
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	When='Engaged'},	
		{Name='Haste',		Buff='Haste',			SpellID=57,		When='Always'},
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	When='Always'},		
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},		
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		When='OutOfCombat'},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		When='OutOfCombat'},
		{Name='Blink',		Buff='Blink',			SpellID=53,		When='OutOfCombat'},
		{Name='Shell V',	Buff='Shell',			SpellID=52,		When='Always'},			
		--{Name='Regen IV',	Buff='Regen',			SpellID=477,	When='OutOfCombat'},
		--{Name='Refresh',	Buff='Refresh',			SpellID=109,	When='OutOfCombat'},	
		{Name='Protect IV',	Buff='Protect',			SpellID=46,		When='Always'},	
		{Name='Cocoon',		Buff='Defense Boost',	SpellID=547,	When='Always'},			
		
	},

	Default = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
	
	Tank = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Cocoon',		Buff='Defense Boost',	SpellID=547,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
	
	Full = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},
	Melee = {
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},
}

function check_reaction(act)

	--Gather Info
    local curact = T(act)
    local actor = T{}
	local otherTarget = T{}

    actor.id = curact.actor_id
	-- Make sure it's something we actually care about reacting to.
	if curact.category == 1 and not ((state.AutoEngageMode.value and player.status == 'Idle')) and being_attacked then return end

	if not ((curact.category == 1 or curact.category == 3 or curact.category == 4 or curact.category == 7 or curact.category == 8 or curact.category == 11 or curact.category == 13)) then return end
	-- Make sure it's a mob that's doing something.
    if windower.ffxi.get_mob_by_id(actor.id) then
        actor = windower.ffxi.get_mob_by_id(actor.id)
    else
        return
    end

	-- Check if we're targetting it.
    if player and player.target and player.target.id and actor.id == player.target.id then
        isTarget = true
    else
		isTarget = false
    end

	if curact.targets[1].id == nil then
		targetsMe = false
		targetsSelf = false
		otherTarget.in_party = false
		otherTarget.in_alliance = false
		targetsDistance = 50
	elseif curact.targets[1].id == player.id then
		otherTarget.in_party = false
		otherTarget.in_alliance = false
		targetsMe = true
		targetsSelf = false
		targetsDistance = 0
	elseif curact.targets[1].id == actor.id	then
		if windower.ffxi.get_mob_by_id(curact.targets[1].id) then
			otherTarget = windower.ffxi.get_mob_by_id(curact.targets[1].id)
		else
			otherTarget.in_party = false
			otherTarget.in_alliance = false
			otherTarget.distance = 10000
		end
		targetsMe = false
		targetsSelf = true
		targetsDistance = math.sqrt(otherTarget.distance)
	else
		if windower.ffxi.get_mob_by_id(curact.targets[1].id) then
			otherTarget = windower.ffxi.get_mob_by_id(curact.targets[1].id)
		else
			otherTarget.in_party = false
			otherTarget.in_alliance = false
			otherTarget.distance = 10000
		end
		targetsSelf = false
		targetsMe = false
		targetsDistance = math.sqrt(otherTarget.distance)
	end
	
	if curact.category == 1 then
		if targetsMe then
			if state.AutoEngageMode.value and actor.race == 0 and math.sqrt(actor.distance) < (3.2 + actor.model_size) and player.status == 'Idle' and not (moving or engaging > os.clock() or actor.name:contains("'s ")) then
				engaging = os.clock() + 2
				
				packets.inject(packets.new('outgoing', 0x1a, {
					['Target'] = actor.id,
					['Target Index'] = actor.index,
					['Category']     = 0x02,
				}))
				
			elseif player.status == 'Idle' and not (being_attacked or midaction() or pet_midaction() or (petWillAct + 2) > os.clock()) then
				windower.send_command('gs c forceequip')
			end
			being_attacked = true
		end
		return
	end

	-- Track buffs locally
	if curact.category == 4 then
		act_info = res.spells[curact.param]
		if curact.targets[1].actions[1].message == 230 then
			if EnhancingAbility:contains(act_info.name) then
				if act_info.name:endswith('II') then
					if act_info.name:startswith('Haste') then
						lasthaste = 2
					elseif act_info.name:startswith('Flurry') then
						lastflurry = 2
					end
				else
					if act_info.name:startswith('Haste') then
						lasthaste = 1
					elseif act_info.name:startswith('Flurry') then
						lastflurry = 1
					elseif act_info.name == "Erratic Flutter" then
						lasthaste = 2
					elseif act_info.name == "Animating Wail" then
						lasthaste = 1
					end
				end
			end
		end
	elseif curact.category == 13 then
		act_info = res.job_abilities[curact.param]
		if act_info.name == 'Hastega II' then
			lasthaste = 2
		elseif act_info.name == 'Hastega' then
			lasthaste = 1
		end
	end
	
	-- Turn off Defense if needed for things we're targetting.
	if (curact.category == 3 or curact.category == 4 or curact.category == 11 or curact.category == 13) then
		if isTarget and player.target.type == "MONSTER" and state.AutoDefenseMode.value and state.DefenseMode.value ~= 'None' then
			if state.TankAutoDefense.value then
				if state.DefenseMode.value ~= 'Physical' then
					state.DefenseMode:set('Physical')
					send_command('gs c forceequip')
					if state.DisplayMode.value then update_job_states()	end
				end
			else
				state.DefenseMode:reset()
				send_command('gs c forceequip')
				if state.DisplayMode.value then update_job_states()	end
			end
		elseif not (actor.id == player.id or midaction() or pet_midaction()) and (targetsMe or (otherTarget.in_alliance and targetsDistance < 10)) then
			--reequip proper gear after curaga/recieved buffs
			send_command('gs c forceequip')
		end
		return
	end
	
	-- Make sure it's not US from this point on!
	if actor.id == player.id then return end
    -- Make sure it's a WS or MA precast before reacting to it.		
    if not (curact.category == 7 or curact.category == 8) then return end
	
    -- Get the name of the action.
    if curact.category == 7 then act_info = res.monster_abilities[curact.targets[1].actions[1].param] end
    if curact.category == 8 then act_info = res.spells[curact.targets[1].actions[1].param] end
	if act_info == nil then return end

	-- Reactions begin.
	if state.BlockWarp.value and ((targetsMe and (act_info.name == 'Warp II' or act_info.name == 'Retrace')) or (actor.in_party and (act_info.name:contains('Teleport') or act_info.name:contains('Recall')))) then
		local party = windower.ffxi.get_party()
	
		if party.party1_leader == player.id then
			windower.chat.input('/pcmd kick '..actor.name..'')
		else
			windower.chat.input('/pcmd leave')
		end
		return
	elseif midaction() or curact.category ~= 8 or state.DefenseMode.value ~= 'None' or ((petWillAct + 2) > os.clock()) then
			
	elseif targetsMe then
		if CureAbility:contains(act_info.name) and player.hpp < 75 then
			if sets.Cure_Received then
				do_equip('sets.Cure_Received')
			elseif sets.Self_Healing then
				do_equip('sets.Self_Healing') 
			end
			return
		elseif RefreshAbility:contains(act_info.name) then
			if sets.Refresh_Received then
				do_equip('sets.Refresh_Received')
			elseif sets.Self_Refresh then
				do_equip('sets.Self_Refresh')
			end
			return
		elseif PhalanxAbility:contains(act_info.name) then
			if sets.Phalanx_Received then
				do_equip('sets.Phalanx_Received')
			elseif sets.midcast.Phalanx then
				do_equip('sets.midcast.Phalanx')
			end
			return
		elseif ProshellAbility:contains(act_info.name) then
			if sets.Sheltered then do_equip('sets.Sheltered') return end
		end
	elseif actor.in_party and otherTarget.in_party and targetsDistance < 10 then

		if CuragaAbility:contains(act_info.name) and player.hpp < 75 then
			if sets.Cure_Received then
				do_equip('sets.Cure_Received')
			elseif sets.Self_Healing then
				do_equip('sets.Self_Healing') 
			end
			return
		elseif ProshellraAbility:contains(act_info.name) and sets.Sheltered then
			do_equip('sets.Sheltered') return
		end
	end
	
	-- Make sure this is our target. 	send_command('input /echo Actor:'..actor.id..' Target:'..player.target.id..'')
	if curact.param == 24931 then --24931 is initiation paramater for action category 7 and 8
		if isTarget and state.AutoStunMode.value and player.target.type == "MONSTER" and not moving then
			if StunAbility:contains(act_info.name) and not midaction() and not pet_midaction() then
				gearswap.refresh_globals(false)				
				if not (buffactive.silence or  buffactive.mute or buffactive.Omerta) then
					local spell_recasts = windower.ffxi.get_spell_recasts()
				
					if player.main_job == 'BLM' or player.sub_job == 'BLM' or player.main_job == 'DRK' or player.sub_job == 'DRK' and spell_recasts[252] < spell_latency then
						windower.chat.input('/ma "Stun" <t>') return
					elseif player.main_job == 'BLU' and spell_recasts[692] < spell_latency then
						windower.chat.input('/ma "Sudden Lunge" <t>') return
					elseif player.sub_job == 'BLU' and spell_recasts[623] < spell_latency then
						windower.chat.input('/ma "Head Butt" <t>') return
					end
				end

				local abil_recasts = windower.ffxi.get_ability_recasts()
				
				if not (buffactive.amnesia or buffactive.impairment) then
				
					if (player.main_job == 'PLD' or player.sub_job == 'PLD') and abil_recasts[73] < latency then
						windower.chat.input('/ja "Shield Bash" <t>') return
					elseif (player.main_job == 'DRK' or player.sub_job == 'DRK') and abil_recasts[88] < latency then
						windower.chat.input('/ja "Weapon Bash" <t>') return
					elseif player.main_job == 'SMN' and pet.name == "Ramuh" and abil_recasts[174] < latency then
						windower.chat.input('/pet "Shock Squall" <t>') return
					elseif (player.main_job == 'SAM') and player.merits.blade_bash and abil_recasts[137] < latency then
						windower.chat.input('/ja "Blade Bash" <t>') return
					elseif not player.status == 'Engaged' then
					
					elseif (player.main_job == 'DNC' or player.sub_job == 'DNC') and abil_recasts[221] < latency then
						windower.chat.input('/ja "Violent Flourish" <t>') return
					end
				
					local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
					if player.tp > 700 then
						if available_ws:contains(35) then
							windower.chat.input('/ws "Flat Blade" <t>') return
						elseif available_ws:contains(145) then
							windower.chat.input('/ws "Tachi Hobaku" <t>') return
						elseif available_ws:contains(2) then
							windower.chat.input('/ws "Shoulder Tackle" <t>') return
						elseif available_ws:contains(65) then
							windower.chat.input('/ws "Smash Axe" <t>') return
						elseif available_ws:contains(115) then
							windower.chat.input('/ws "Leg Sweep" <t>') return
						end
					end
				end
			end
		end
		if state.AutoDefenseMode.value then
			local ability_type = nil
			if PhysicalAbility:contains(act_info.name) then
				ability_type = 'Physical'
			elseif MagicalAbility:contains(act_info.name) then
				ability_type = 'Magical'
			elseif ResistAbility:contains(act_info.name) then
				ability_type = 'Resist'
			end
			if targetsMe or (AoEAbility:contains(act_info.name) and ((otherTarget.in_alliance and targetsDistance < 10) or targetsSelf)) then
				local defensive_action = false
				if not midaction() then
					local abil_recasts = windower.ffxi.get_ability_recasts()
					if player.main_job == 'DRG' and state.AutoJumpMode.value and abil_recasts[160] < latency then
						windower.chat.input('/ja "Super Jump" <t>')
						defensive_action = true
					elseif (player.main_job == 'SAM' or player.sub_job == 'SAM') and ability_type == 'Physical' and abil_recasts[133] < latency then
						windower.chat.input('/ja "Third Eye" <me>')
						defensive_action = true
					elseif player.main_job == 'RUN' and not buffactive['Pflug'] and ability_type == 'Resist' and abil_recasts[59] < latency and (buffactive[state.RuneElement.value] > 2)then
						windower.chat.input('/ja "Pflug" <me>')
						defensive_action = true
					elseif player.main_job == 'RUN' and not buffactive['One for All'] and ability_type == 'Magical' and abil_recasts[118] < latency then
						windower.chat.input('/ja "One for All" <me>')
						defensive_action = true	
					end
				end

				if not defensive_action then
					if ability_type and state.DefenseMode.value ~= ability_type then
						state.DefenseMode:set(ability_type)
					end
					send_command('gs c forceequip')
					being_attacked = true
					if state.DisplayMode.value then update_job_states()	end
					return
				end
			end
		end
	end
	
	if targetsMe and actor.race == 0 and not being_attacked then
		being_attacked = true
		if not (midaction() or pet_midaction()) then
			send_command('gs c forceequip')
		end
	end
end

windower.raw_register_event('action', check_reaction)

windower.raw_register_event('incoming chunk', function(id, data)
    if id == 0xF9 and state.AutoAcceptRaiseMode.value and data:byte(11) == 1 then
        local player = windower.ffxi.get_mob_by_target('me')
        if player then
			packets.inject(packets.new('outgoing', 0x01A, {
				['Target'] = player.id,
				['Target Index'] = player.index,
				['Category'] = 0x0D,
			}))
            return true
        end
    end
end)
