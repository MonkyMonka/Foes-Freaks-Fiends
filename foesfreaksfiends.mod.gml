#define init

	
	global.level_start = false;
		
	global.limo_data = {
		statue_desecrator		: -1,
		statue_frame			: 0,
		stages_num				: 0
	};
		
	//Wooly Maggot Sprites:
	global.sprWoolyMaggotIdle = sprite_add("sprites/WoolyMaggotFamily/WoolyMaggot/sprWoolyMaggotIdle.png", 4, 8, 8);
	global.sprWoolyMaggotHurt = sprite_add("sprites/WoolyMaggotFamily/WoolyMaggot/sprWoolyMaggotHurt.png", 3, 8, 8);
	global.sprWoolyMaggotDead = sprite_add("sprites/WoolyMaggotFamily/WoolyMaggot/sprWoolyMaggotDead.png", 6, 8, 8);
	global.sprWoolyMaggotCharge = sprite_add("sprites/WoolyMaggotFamily/WoolyMaggot/sprWoolyMaggotCharge.png", 5, 8, 8);
	global.sprStaticTrail = sprite_add("sprites/WoolyMaggotFamily/WoolyMaggot/sprStaticTrail.png", 3, 4, 4);
	//Big Wooly Maggot Sprites:
	global.sprBigWoolyMaggotIdle = sprite_add("sprites/WoolyMaggotFamily/BigWoolyMaggot/sprBigWoolyMaggotIdle.png", 6, 24, 18);
	global.sprBigWoolyMaggotHurt = sprite_add("sprites/WoolyMaggotFamily/BigWoolyMaggot/sprBigWoolyMaggotHurt.png", 3, 24, 18);
	global.sprBigWoolyMaggotDead = sprite_add("sprites/WoolyMaggotFamily/BigWoolyMaggot/sprBigWoolyMaggotIdle.png", 6, 24, 18);
	global.sprBigWoolyMaggotAppear = sprite_add("sprites/WoolyMaggotFamily/BigWoolyMaggot/sprBigWoolyMaggotIdle.png", 6, 24, 18);
	global.sprBigWoolyMaggotBurrow = sprite_add("sprites/WoolyMaggotFamily/BigWoolyMaggot/sprBigWoolyMaggotIdle.png", 6, 24, 18);
	//Wooly Worm Sprites:
	//Thief Sprites:
	//Rat Canister Sprites:
	global.sprRatCanisterIdle = sprite_add("sprites/RatCanister/sprRatCanisterIdle.png", 4, 12, 12);
	global.sprRatCanisterHurt = sprite_add("sprites/RatCanister/sprRatCanisterHurt.png", 3, 12, 12);
	global.sprRatCanisterDead = sprite_add("sprites/RatCanister/sprRatCanisterDead.png", 6, 12, 12);
	global.sprRatCanisterWalk = sprite_add("sprites/RatCanister/sprRatCanisterWalk.png", 6, 24, 12);
	//Javlineer Bandit Sprites:
	global.sprJavlineerBanditIdle = sprite_add("sprites/EliteBandits/JavelineerBandit/sprJavlineerBanditIdle.png", 4, 12, 12);
	global.sprJavlineerBanditHurt = sprite_add("sprites/EliteBandits/JavelineerBandit/sprJavlineerBanditHurt.png", 3, 12, 12);
	global.sprJavlineerBanditDead = sprite_add("sprites/EliteBandits/JavelineerBandit/sprJavlineerBanditDead.png", 6, 12, 12);
	global.sprJavlineerBanditWalk = sprite_add("sprites/EliteBandits/JavelineerBandit/sprJavlineerBanditWalk.png", 6, 12, 12);
	global.sprJavlineerBanditFire = sprite_add("sprites/EliteBandits/JavelineerBandit/sprJavlineerBanditFire.png", 3, 12, 12);
		
	//Limousine Prop Sprites:
	global.sprLimoPropIdle		= sprite_add("sprites/EliteMansion/Limousine/Prop/sprLimoPropIdle.png", 1, 19, 50);
	global.sprLimoPropHurt		= sprite_add("sprites/EliteMansion/Limousine/Prop/sprLimoPropHurt.png", 3, 19, 50);
	global.sprLimoPropBaseIdle	= sprite_add("sprites/EliteMansion/Limousine/Prop/sprLimoPropBaseIdle.png", 1, 19, 50);
	global.sprLimoPropBaseHurt	= sprite_add("sprites/EliteMansion/Limousine/Prop/sprLimoPropBaseHurt.png", 3, 19, 50);
	global.sprLimoGraffiti		= sprite_add("sprites/EliteMansion/Limousine/Prop/sprGraffiti.png", 8, 19, 50);
	global.sprLimoGraffitiPuff	= sprite_add("sprites/EliteMansion/Limousine/Prop/sprGraffitiPuff.png", 5, 8, 8);
	global.mskLimoProp			= sprite_add("sprites/EliteMansion/Limousine/Prop/mskLimoProp.png", 1, 19, 50);
	//Limousine Sprites:
	global.sprYVLimo	= sprite_add("sprites/EliteMansion/Limousine/sprLimousine.png", 17, 64, 16);
	global.sprYVLimoHurt= sprite_add("sprites/EliteMansion/Limousine/sprLimousineHurt.png", 17, 64, 16);
	global.mskYVLimo	= sprite_add("sprites/EliteMansion/Limousine/mskLimousine.png", 1, 64, 16);
	
	global.libLoaded = false;
	if (fork())
	{
		while(!mod_exists("mod", "lib")) {wait(1);}
	
	    script_ref_call(["mod", "lib", "getRef"], "mod", mod_current, "scr");
	
	    var modules = ["libGeneral", "libAreas"];
	    with(modules) call(scr.import, self);
	    
	    global.libLoaded = true;
	    exit;
	}

#define game_start
	global.limo_data = {
		statue_desecrator		: -1,
		statue_frame			: 0,
		stages_num				: 0
	};

#define step 
    
      // Level Start:
    if(instance_exists(GenCont)){
        global.level_start = true;
    }
    else{
        if(global.level_start){
        	
        if (global.limo_data.statue_desecrator != -1) global.limo_data.stages_num ++;
		
        switch(GameCont.area){
            
            case 5:
            case "city":
            
            with(Wolf){
                if(random(3) < 1){
                    mod_script_call('mod', 'foesfreaksfiends', 'WoolyMaggot_create', x, y);
                    instance_delete(self);
                }
            }
            
            break;
            
            case 103:
            case "mansion":
            var	_entranceFloor = [], _entranceIndex = -1
        	
			with (FloorNormal)
			{
				if( point_distance(bbox_center_x, bbox_center_y, _spawnX, _spawnY) > 48)
				{
					if (!place_meeting(x, y, Wall) && !place_meeting(x, y, prop) && !place_meeting(x, y, chestprop))
					{
						array_push(_entranceFloor, self);
						_entranceIndex++;
					}
				}
			}
			
			call(scr.array_shuffle,(_entranceFloor));
			if	(_entranceIndex >= 0) with(_entranceFloor[_entranceIndex--])
			{
				var	_w          = 3,
					_h          = 3,
					_type       = "",
					_dirOff     = 0,
					_floorDis   = 0,
					_spawnX     = x,
					_spawnY     = y,
					_spawnDis   = 128,
					_spawnFloor = FloorNormal;
		
				with call(scr.floor_room, _spawnX, _spawnY, _spawnDis, _spawnFloor, _w, _h, _type, _dirOff, _floorDis)
				{
					LimoProp_create(x, y);
				}		
			}
				
            break;
            }
            
            global.level_start = false;
        }
    }
    
    
    if button_pressed(0,"horn")
    {
		repeat(1)
		{
			YVLimo_create(mouse_x, mouse_y);
		}
    }

#define draw
	with (instances_matching(CustomProp, "name", "Limo Prop"))
	{
		var _idle = sprite_index == spr_idle,
			_data = global.limo_data;
			
		draw_sprite_ext(_idle ? spr_idlestatue : spr_hurtstatue, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
		
		if (_data.statue_desecrator > -1)
		{
			draw_sprite_ext(global.sprLimoGraffiti, _data.statue_frame, x, y, image_xscale, image_yscale, image_angle, player_get_color(_data.statue_desecrator), image_alpha);
		}
	}

#define draw_shadows
	with (instances_matching(CustomEnemy, "name", "YV Limo"))
	{
		draw_sprite_ext(global.sprYVLimo, 8, x, y, 0.8, 0.8, image_angle, c_black, 1);
	}

//#region DESERT:
#define JavlineerBandit_create(_x, _y)
	with instance_create(_x, _y, CustomEnemy){
    	
    	// youll want to set the name here, both because I stuck it in hitid and for mod support
    	name = "Javlineer Bandit"
    	
    	
        // this is where you'll set your sprites and such, nts_color_blood isn't needed but makes it work with various blood mods, so its just nice to add.
        // Visuals:
        spr_idle = global.sprJavlineerBanditIdle;
		spr_walk = global.sprJavlineerBanditWalk;
		spr_hurt = global.sprJavlineerBanditHurt;
		spr_dead = global.sprJavlineerBanditDead;
		spr_fire = global.sprJavlineerBanditFire;
	
		
		sprite_index    = spr_idle;
		image_speed     = 0.4;
		depth           = -2;
		hitid           = [spr_idle, name]
        spr_shadow      = shd24;
        nts_color_blood = [c_red, make_color_rgb(134, 44, 35)]
        
        
        // this is where you change your enemy's stats and add any needed variables, most should be self explanatory but if you need help ask.
        // Vars:
        mask_index    = mskRat;
        direction     = random(360);
        maxhealth     = 24;
       	my_health     = maxhealth;
        raddrop       = 20;
        maxspeed      = 2.5;
        walkspeed     = maxspeed;
        canmelee      = 1;
        meleedamage   = 2;
        throw_time = 0;
        throwing = false;
        team          = 1;
        targetvisible = 0;
        target        = 0;
        walk          = 0;
        gunangle      = 180;
        fff_bloomamount = 0;
        fff_bloomtransparency = 0.1;
        
        snd_dead = sndRatDie;

        // setting your alarm amounts here is basically just how quickly they can attack after spawning, usually just keep it at this amount.
        // if you need something to be able to attack RIGHT after spawning set it to like 10 or something.
        // Alarms:
        alarm1 = 20 + irandom(30);

        // set you stuff in here, I have some generic things to set, scroll to the bottom of the file to see them if you want.
        // GunEnemy_draw is for drawing an enemy that wields a ranged weapon, theres also BasicEnemy_draw (no weapon) and MeleeEnemy_draw (melee weapon) in this file.
        // Enemy_hurt is just a standard enemy hurt function, replace it if you want a special on_hurt effect.
        // StandardDrops drops what is pretty much a 'Normal' amount of pickups.
        // Alrm1 is where you'll set your actual attacks, you can have more than one alarm but the majority of enemies dont need them and I dont feel like explaining it.
        
        //Scripts:
        on_step  = script_ref_create(JavlineerBandit_step);
        on_draw  = BasicEnemy_draw;
        on_hurt  = JavlineerBandit_hurt;
        on_death = LowDrops;
        on_alrm1 = script_ref_create(JavlineerBandit_alrm1);
        
        return self;
	}

#define JavlineerBandit_step

    // surprise surprise its actually really simple in this step to the point you probably don't need to touch this.
    // this is just some simple stuff that sets sprites and handles alarms and speed, only touch this if you have extra sprites like charging or whatever.
    // ask me if you think something needs to go in here, if you're making like, a bandit, it shouldn't need to change this.

	 // Alarms:
	if("on_alrm0" in self and alarm0_run) exit;
	if("on_alrm1" in self and alarm1_run) exit;

		// Movement:
	if(walk > 0){ walk -= current_time_scale;   speed += walkspeed * current_time_scale;   gunangle = direction }
	
		//Speed Cap:
	if(speed > maxspeed){ speed = maxspeed; }
	
		  // Animate:
   if (throwing == true){
        throw_time -= current_time_scale;
		}
    
    	if (throw_time <= 0) {
        throwing = false;
    	}
    if(anim_end){
		    if (!throwing) {
		        sprite_index = enemy_sprite;
		    }
    	}	
	
		//Use Your Eyes:
	right = (gunangle + 270) mod 360 > 180 ? 1 : -1;

#define JavlineerBandit_alrm1

    // setting the alarm here is basically just resetting the attack/movement timer.
    // making it set a larger number will make there be a longer delay, think of it just as a timer that ticks down, because thats what it is.
	alarm1 = 40 + irandom(30);

             // makes the enemy look at that dastardly fella.
	if(enemy_target(x, y) and target_visible) {
		enemy_look(target_direction);
		
		    // This makes the enemy walk towards it's target if its too far away.
		if(target_distance > 128){
			alarm1 = 30 + irandom(15);
			enemy_walk(target_direction + orandom(30), alarm1 - 10);
		}
			 // Checks if within range before attacking, most enemies don't actually check for range and just attack at any distance.
		if(target_distance < 128){
			 // Attack:
			 // this check makes their attacks a bit more random, and makes sure they're not too close to the target, remove this if you want.
			 // MOST enemies in the game have a behavorior like this, including short range enemies like gators.
			 // if you dont believe me spawn some snipers or gators and stand right next to them, theyll just try and move away instead of shooting.
			 
			if(chance(3, 4) and (target_distance > 32)){
			    
			    // set the attack timer here if you want to have a different timer from the walkin and such.
				alarm1 = 60 + irandom(30);
        		
        		image_index = 0;
        		sprite_index = spr_fire;
        		
        		sound_play_pitchvol(sndLightningCannonEnd, 2, 0.5);
				throwing = true;
				throw_time = 40;
				enemy_walk(target_direction + orandom(30), alarm1 - 10);
		
			}
			
			         // this makes em move away if too close, see where this connects to the target distance check above.
					 // Move Away From Target:
			else{
				alarm1 = 30 + irandom(15);
				enemy_walk(gunangle + 180 + orandom(30), alarm1 - 10);
			}
		}
	}
	    // just walk around like an idiot if you aren't doing anything better
	 // Wander Around Town:
	else{
		enemy_walk(random(360), 30);
		enemy_look(direction);
	}
	
#define JavlineerBandit_hurt(_dmg, _spd, _dir)
    
    sprite_index = spr_hurt;
	image_index  = 0;
	
    var _snd = sound_play_hit(sndConfetti1, 0.1);
    audio_sound_gain(_snd, 0.7, 0);
    audio_sound_set_track_position(_snd, 0.1);
    audio_sound_gain(sound_play_hit(sndRatHit, 1.5), 1.5, 0.2);
    
    nexthurt   = current_frame + 6;
	my_health -= _dmg;
//#endregion
//#region SEWERS:
#define RatCanister_create(_x, _y)
	with instance_create(_x, _y, CustomEnemy){
    	
    	// youll want to set the name here, both because I stuck it in hitid and for mod support
    	name = "Rat Canister"
    	
    	
        // this is where you'll set your sprites and such, nts_color_blood isn't needed but makes it work with various blood mods, so its just nice to add.
        // Visuals:
        spr_idle = global.sprRatCanisterIdle;
		spr_walk = global.sprRatCanisterWalk;
		spr_hurt = global.sprRatCanisterHurt;
		spr_dead = global.sprRatCanisterDead;
	
		
		sprite_index    = spr_idle;
		image_speed     = 0.4;
		depth           = -2;
		hitid           = [spr_idle, name]
        spr_shadow      = shd24;
        nts_color_blood = [c_red, make_color_rgb(134, 44, 35)]
        
        
        // this is where you change your enemy's stats and add any needed variables, most should be self explanatory but if you need help ask.
        // Vars:
        mask_index    = mskRat;
        direction     = random(360);
        maxhealth     = 24;
       	my_health     = maxhealth;
        raddrop       = 20;
        maxspeed      = 2.5;
        walkspeed     = maxspeed;
        canmelee      = 1;
        meleedamage   = 2;
        team          = 1;
        targetvisible = 0;
        target        = 0;
        walk          = 0;
        gunangle      = 180;
        fff_bloomamount = 0;
        fff_bloomtransparency = 0.1;
        
        snd_dead = sndRatDie;

        // setting your alarm amounts here is basically just how quickly they can attack after spawning, usually just keep it at this amount.
        // if you need something to be able to attack RIGHT after spawning set it to like 10 or something.
        // Alarms:
        alarm1 = 20 + irandom(30);

        // set you stuff in here, I have some generic things to set, scroll to the bottom of the file to see them if you want.
        // GunEnemy_draw is for drawing an enemy that wields a ranged weapon, theres also BasicEnemy_draw (no weapon) and MeleeEnemy_draw (melee weapon) in this file.
        // Enemy_hurt is just a standard enemy hurt function, replace it if you want a special on_hurt effect.
        // StandardDrops drops what is pretty much a 'Normal' amount of pickups.
        // Alrm1 is where you'll set your actual attacks, you can have more than one alarm but the majority of enemies dont need them and I dont feel like explaining it.
        
        //Scripts:
        on_step  = script_ref_create(RatCanister_step);
        on_draw  = BasicEnemy_draw;
        on_hurt  = RatCanister_hurt;
        on_death = LowDrops;
        on_alrm1 = script_ref_create(RatCanister_alrm1);
        
        return self;
	}

#define RatCanister_step

    // surprise surprise its actually really simple in this step to the point you probably don't need to touch this.
    // this is just some simple stuff that sets sprites and handles alarms and speed, only touch this if you have extra sprites like charging or whatever.
    // ask me if you think something needs to go in here, if you're making like, a bandit, it shouldn't need to change this.

	 // Alarms:
	if("on_alrm0" in self and alarm0_run) exit;
	if("on_alrm1" in self and alarm1_run) exit;

		// Movement:
	if(walk > 0){ walk -= current_time_scale;   speed += walkspeed * current_time_scale;   gunangle = direction }
	
		//Speed Cap:
	if(speed > maxspeed){ speed = maxspeed; }
	
		  // Animate:
   sprite_index = enemy_sprite;
	
	
		//Use Your Eyes:
	right = (gunangle + 270) mod 360 > 180 ? 1 : -1;

#define RatCanister_alrm1

    // setting the alarm here is basically just resetting the attack/movement timer.
    // making it set a larger number will make there be a longer delay, think of it just as a timer that ticks down, because thats what it is.
	alarm1 = 40 + irandom(30);

             // makes the enemy look at that dastardly fella.
	if(enemy_target(x, y) and target_visible) {
		enemy_look(target_direction);
		
		    // This makes the enemy walk towards it's target if its too far away.
		if(target_distance > 128){
			alarm1 = 30 + irandom(15);
			enemy_walk(target_direction + orandom(30), alarm1 - 10);
		}
			 // Checks if within range before attacking, most enemies don't actually check for range and just attack at any distance.
		if(target_distance < 128){
			 // Attack:
			 // this check makes their attacks a bit more random, and makes sure they're not too close to the target, remove this if you want.
			 // MOST enemies in the game have a behavorior like this, including short range enemies like gators.
			 // if you dont believe me spawn some snipers or gators and stand right next to them, theyll just try and move away instead of shooting.
			 
			if(chance(3, 4) and (target_distance > 32)){
			    
			    // set the attack timer here if you want to have a different timer from the walkin and such.
				alarm1 = 60 + irandom(30);
        		
        		sound_play_pitchvol(sndLightningCannonEnd, 2, 0.5);
				enemy_walk(target_direction + orandom(30), alarm1 - 10);
				
		
			}
			
			         // this makes em move away if too close, see where this connects to the target distance check above.
					 // Move Away From Target:
			else{
				alarm1 = 30 + irandom(15);
				enemy_walk(gunangle + 180 + orandom(30), alarm1 - 10);
			}
		}
	}
	    // just walk around like an idiot if you aren't doing anything better
	 // Wander Around Town:
	else{
		enemy_walk(random(360), 30);
		enemy_look(direction);
	}
	
#define RatCanister_hurt(_dmg, _spd, _dir)
    
    sprite_index = spr_hurt;
	image_index  = 0;
	
    var _snd = sound_play_hit(sndConfetti1, 0.1);
    audio_sound_gain(_snd, 0.7, 0);
    audio_sound_set_track_position(_snd, 0.1);
    audio_sound_gain(sound_play_hit(sndRatHit, 1.5), 1.5, 0.2);
    
    nexthurt   = current_frame + 6;
	my_health -= _dmg;
//#endregion

//#region VENUZ MANSION:
#define FireballSergeant_create(_x, _y)
	with instance_create(_x, _y, CustomEnemy){
    	
    	// youll want to set the name here, both because I stuck it in hitid and for mod support
    	name = "Fireball Sergeant"
    	
    	
        // this is where you'll set your sprites and such, nts_color_blood isn't needed but makes it work with various blood mods, so its just nice to add.
        // Visuals:
        spr_idle = global.sprJavlineerBanditIdle;
		spr_walk = global.sprJavlineerBanditWalk;
		spr_hurt = global.sprJavlineerBanditHurt;
		spr_dead = global.sprJavlineerBanditDead;
		spr_fire = global.sprJavlineerBanditFire;
	
		sprite_index    = spr_idle;
		image_speed     = 0.4;
		depth           = -2;
		hitid           = [spr_idle, name]
        spr_shadow      = shd24;
        nts_color_blood = [c_red, make_color_rgb(134, 44, 35)]
        
        
        // this is where you change your enemy's stats and add any needed variables, most should be self explanatory but if you need help ask.
        // Vars:
        mask_index    = mskRat;
        direction     = random(360);
        maxhealth     = 24;
       	my_health     = maxhealth;
        raddrop       = 20;
        maxspeed      = 2.5;
        walkspeed     = maxspeed;
        canmelee      = 1;
        meleedamage   = 2;
        throw_time = 0;
        throwing = false;
        team          = 1;
        targetvisible = 0;
        target        = 0;
        walk          = 0;
        gunangle      = 180;
        fff_bloomamount = 0;
        fff_bloomtransparency = 0.1;
        
        snd_dead = sndRatDie;

        // setting your alarm amounts here is basically just how quickly they can attack after spawning, usually just keep it at this amount.
        // if you need something to be able to attack RIGHT after spawning set it to like 10 or something.
        // Alarms:
        alarm1 = 20 + irandom(30);

        // set you stuff in here, I have some generic things to set, scroll to the bottom of the file to see them if you want.
        // GunEnemy_draw is for drawing an enemy that wields a ranged weapon, theres also BasicEnemy_draw (no weapon) and MeleeEnemy_draw (melee weapon) in this file.
        // Enemy_hurt is just a standard enemy hurt function, replace it if you want a special on_hurt effect.
        // StandardDrops drops what is pretty much a 'Normal' amount of pickups.
        // Alrm1 is where you'll set your actual attacks, you can have more than one alarm but the majority of enemies dont need them and I dont feel like explaining it.
        
        //Scripts:
        on_step  = script_ref_create(FireballSergeant_step);
        on_draw  = BasicEnemy_draw;
        on_hurt  = FireballSergeant_hurt;
        on_death = LowDrops;
        on_alrm1 = script_ref_create(FireballSergeant_alrm1);
        
        return self;
	}

#define FireballSergeant_step

    // surprise surprise its actually really simple in this step to the point you probably don't need to touch this.
    // this is just some simple stuff that sets sprites and handles alarms and speed, only touch this if you have extra sprites like charging or whatever.
    // ask me if you think something needs to go in here, if you're making like, a bandit, it shouldn't need to change this.

	 // Alarms:
	if("on_alrm0" in self and alarm0_run) exit;
	if("on_alrm1" in self and alarm1_run) exit;

		// Movement:
	if(walk > 0){ walk -= current_time_scale;   speed += walkspeed * current_time_scale;   gunangle = direction }
	
		//Speed Cap:
	if(speed > maxspeed){ speed = maxspeed; }
	
		  // Animate:
   if (throwing == true){
        throw_time -= current_time_scale;
		}
    
    	if (throw_time <= 0) {
        throwing = false;
    	}
    if(anim_end){
		    if (!throwing) {
		        sprite_index = enemy_sprite;
		    }
    	}	
	
		//Use Your Eyes:
	right = (gunangle + 270) mod 360 > 180 ? 1 : -1;

#define FireballSergeant_alrm1

    // setting the alarm here is basically just resetting the attack/movement timer.
    // making it set a larger number will make there be a longer delay, think of it just as a timer that ticks down, because thats what it is.
	alarm1 = 40 + irandom(30);

             // makes the enemy look at that dastardly fella.
	if(enemy_target(x, y) and target_visible) {
		enemy_look(target_direction);
		
		    // This makes the enemy walk towards it's target if its too far away.
		if(target_distance > 128){
			alarm1 = 30 + irandom(15);
			enemy_walk(target_direction + orandom(30), alarm1 - 10);
		}
			 // Checks if within range before attacking, most enemies don't actually check for range and just attack at any distance.
		if(target_distance < 128){
			 // Attack:
			 // this check makes their attacks a bit more random, and makes sure they're not too close to the target, remove this if you want.
			 // MOST enemies in the game have a behavorior like this, including short range enemies like gators.
			 // if you dont believe me spawn some snipers or gators and stand right next to them, theyll just try and move away instead of shooting.
			 
			if(chance(3, 4) and (target_distance > 32)){
			    
			    // set the attack timer here if you want to have a different timer from the walkin and such.
				alarm1 = 60 + irandom(30);
        		
        		image_index = 0;
        		sprite_index = spr_fire;
        		
        		sound_play_pitchvol(sndLightningCannonEnd, 2, 0.5);
				throwing = true;
				throw_time = 40;
				enemy_walk(target_direction + orandom(30), alarm1 - 10);
		
			}
			
			         // this makes em move away if too close, see where this connects to the target distance check above.
					 // Move Away From Target:
			else{
				alarm1 = 30 + irandom(15);
				enemy_walk(gunangle + 180 + orandom(30), alarm1 - 10);
			}
		}
	}
	    // just walk around like an idiot if you aren't doing anything better
	 // Wander Around Town:
	else{
		enemy_walk(random(360), 30);
		enemy_look(direction);
	}
	
#define FireballSergeant(_dmg, _spd, _dir)
    
    sprite_index = spr_hurt;
	image_index  = 0;
	
    var _snd = sound_play_hit(sndConfetti1, 0.1);
    audio_sound_gain(_snd, 0.7, 0);
    audio_sound_set_track_position(_snd, 0.1);
    audio_sound_gain(sound_play_hit(sndRatHit, 1.5), 1.5, 0.2);
    
    nexthurt   = current_frame + 6;
	my_health -= _dmg;
	
#define Chick(_x, _y)
	with instance_create(_x, _y, CustomEnemy){
    	
    	// youll want to set the name here, both because I stuck it in hitid and for mod support
    	name = "Chick"
    	
    	
        // this is where you'll set your sprites and such, nts_color_blood isn't needed but makes it work with various blood mods, so its just nice to add.
        // Visuals:
        spr_idle = global.sprJavlineerBanditIdle;
		spr_walk = global.sprJavlineerBanditWalk;
		spr_hurt = global.sprJavlineerBanditHurt;
		spr_dead = global.sprJavlineerBanditDead;
		spr_fire = global.sprJavlineerBanditFire;
	
		sprite_index    = spr_idle;
		image_speed     = 0.4;
		depth           = -2;
		hitid           = [spr_idle, name]
        spr_shadow      = shd24;
        nts_color_blood = [c_red, make_color_rgb(134, 44, 35)]
        
        
        // this is where you change your enemy's stats and add any needed variables, most should be self explanatory but if you need help ask.
        // Vars:
        mask_index    = mskRat;
        direction     = random(360);
        maxhealth     = 24;
       	my_health     = maxhealth;
        raddrop       = 20;
        maxspeed      = 2.5;
        walkspeed     = maxspeed;
        canmelee      = 1;
        meleedamage   = 2;
        throw_time = 0;
        throwing = false;
        team          = 1;
        targetvisible = 0;
        target        = 0;
        walk          = 0;
        gunangle      = 180;
        fff_bloomamount = 0;
        fff_bloomtransparency = 0.1;
        
        snd_dead = sndRatDie;

        // setting your alarm amounts here is basically just how quickly they can attack after spawning, usually just keep it at this amount.
        // if you need something to be able to attack RIGHT after spawning set it to like 10 or something.
        // Alarms:
        alarm1 = 20 + irandom(30);

        // set you stuff in here, I have some generic things to set, scroll to the bottom of the file to see them if you want.
        // GunEnemy_draw is for drawing an enemy that wields a ranged weapon, theres also BasicEnemy_draw (no weapon) and MeleeEnemy_draw (melee weapon) in this file.
        // Enemy_hurt is just a standard enemy hurt function, replace it if you want a special on_hurt effect.
        // StandardDrops drops what is pretty much a 'Normal' amount of pickups.
        // Alrm1 is where you'll set your actual attacks, you can have more than one alarm but the majority of enemies dont need them and I dont feel like explaining it.
        
        //Scripts:
        on_step  = script_ref_create(Chick_step);
        on_draw  = BasicEnemy_draw;
        on_hurt  = Chick_hurt;
        on_death = LowDrops;
        on_alrm1 = script_ref_create(Chick_alrm1);
        
        return self;
	}

#define Chick_step

    // surprise surprise its actually really simple in this step to the point you probably don't need to touch this.
    // this is just some simple stuff that sets sprites and handles alarms and speed, only touch this if you have extra sprites like charging or whatever.
    // ask me if you think something needs to go in here, if you're making like, a bandit, it shouldn't need to change this.

	 // Alarms:
	if("on_alrm0" in self and alarm0_run) exit;
	if("on_alrm1" in self and alarm1_run) exit;

		// Movement:
	if(walk > 0){ walk -= current_time_scale;   speed += walkspeed * current_time_scale;   gunangle = direction }
	
		//Speed Cap:
	if(speed > maxspeed){ speed = maxspeed; }
	
		  // Animate:
   if (throwing == true){
        throw_time -= current_time_scale;
		}
    
    	if (throw_time <= 0) {
        throwing = false;
    	}
    if(anim_end){
		    if (!throwing) {
		        sprite_index = enemy_sprite;
		    }
    	}	
	
		//Use Your Eyes:
	right = (gunangle + 270) mod 360 > 180 ? 1 : -1;

#define Chick_alrm1

    // setting the alarm here is basically just resetting the attack/movement timer.
    // making it set a larger number will make there be a longer delay, think of it just as a timer that ticks down, because thats what it is.
	alarm1 = 40 + irandom(30);

             // makes the enemy look at that dastardly fella.
	if(enemy_target(x, y) and target_visible) {
		enemy_look(target_direction);
		
		    // This makes the enemy walk towards it's target if its too far away.
		if(target_distance > 128){
			alarm1 = 30 + irandom(15);
			enemy_walk(target_direction + orandom(30), alarm1 - 10);
		}
			 // Checks if within range before attacking, most enemies don't actually check for range and just attack at any distance.
		if(target_distance < 128){
			 // Attack:
			 // this check makes their attacks a bit more random, and makes sure they're not too close to the target, remove this if you want.
			 // MOST enemies in the game have a behavorior like this, including short range enemies like gators.
			 // if you dont believe me spawn some snipers or gators and stand right next to them, theyll just try and move away instead of shooting.
			 
			if(chance(3, 4) and (target_distance > 32)){
			    
			    // set the attack timer here if you want to have a different timer from the walkin and such.
				alarm1 = 60 + irandom(30);
        		
        		image_index = 0;
        		sprite_index = spr_fire;
        		
        		sound_play_pitchvol(sndLightningCannonEnd, 2, 0.5);
				throwing = true;
				throw_time = 40;
				enemy_walk(target_direction + orandom(30), alarm1 - 10);
		
			}
			
			         // this makes em move away if too close, see where this connects to the target distance check above.
					 // Move Away From Target:
			else{
				alarm1 = 30 + irandom(15);
				enemy_walk(gunangle + 180 + orandom(30), alarm1 - 10);
			}
		}
	}
	    // just walk around like an idiot if you aren't doing anything better
	 // Wander Around Town:
	else{
		enemy_walk(random(360), 30);
		enemy_look(direction);
	}
	
#define Chick_hurt(_dmg, _spd, _dir)
    
    sprite_index = spr_hurt;
	image_index  = 0;
	
    var _snd = sound_play_hit(sndConfetti1, 0.1);
    audio_sound_gain(_snd, 0.7, 0);
    audio_sound_set_track_position(_snd, 0.1);
    audio_sound_gain(sound_play_hit(sndRatHit, 1.5), 1.5, 0.2);
    
    nexthurt   = current_frame + 6;
	my_health -= _dmg;
	
#define LimoProp_create(_x, _y)
	with(instance_create(_x, _y, CustomProp)){
		 // Visual:
		spr_idle	= global.sprLimoPropBaseIdle;
		spr_hurt	= global.sprLimoPropBaseHurt;
		spr_dead	= global.sprLimoPropBaseHurt;
		spr_idlestatue = global.sprLimoPropIdle;
		spr_hurtstatue = global.sprLimoPropHurt;
		
		spr_shadow = shd32;
		spr_shadow_y = -1;
		
		image_xscale = 1;
		depth = 0;
		 // Sounds:
		snd_hurt	= sndStatueHurt;
		snd_dead	= sndStatueDead;
		 // Vars:
		name = "Limo Prop";
		maxhealth	= 999999;
		my_health	= maxhealth;
		mask_index	= global.mskLimoProp;
		
		team		= 0;
		
		var _isclean = global.limo_data.statue_desecrator == -1;
		prompt = call(scr.prompt_create, _isclean ? "DESECRATE" : "CLEAN");
		
		on_step = LimoProp_step;
		on_pick = script_ref_create(LimoProp_interact);
		
		return self;
	}
	
#define LimoProp_step
	speed = 0;
	my_health = maxhealth;

#define LimoProp_interact
	view_shake_at(x, y, 10);
	var _isclean = global.limo_data.statue_desecrator == -1;
	
	if (_isclean)
	{
		global.limo_data.statue_desecrator = other.index;
		global.limo_data.statue_frame = irandom(sprite_get_number(global.sprLimoGraffiti) - 1);
		global.limo_data.stages_num = 0;
		prompt.text = "CLEAN";
		
		sound_play_pitch(sndFlamerStart, random_range(1.1, 1.4));
		repeat(17)
		{
			with instance_create(x, y, Dust)
			{
				motion_set(random(360), random_range(1, 4));
				friction = 0.1;
				depth -= 10;
				image_angle = random(360);
				sprite_index = global.sprLimoGraffitiPuff;
				image_blend = player_get_color(global.limo_data.statue_desecrator);
			}
		}
	}
	else
	{
		global.limo_data.statue_desecrator = -1;
		global.limo_data.statue_frame = 0;
		prompt.text = "DESECRATE";
		
		sound_play_pitch(sndOasisPortal, random_range(1, 1.2));
		repeat(17)
		{
			with instance_create(x, y, Bubble)
			{
				motion_set(random(360), random_range(1, 4));
				friction = 0.1;
				depth -= 10;
				image_angle = random(360);
			}
		}
		
		/* REWARD!
			@Monka you come up with REWARD pls? :pleading: :gayhorse: -chomk
			
			           ,--,
			     _ ___/ /\|
			 ,;'( )__, )  ~
			//  //   '--; 
			'   \     | ^
			     ^    ^
			     
			i made that (thats a lie) -chomk
		*/
		
		global.limo_data.stages_num = 0;
	}
	
#define YVLimo_create(_x, _y)
	with instance_create(_x, _y, CustomEnemy)
	{
		// youll want to set the name here, both because I stuck it in hitid and for mod support
		name = "YV Limo";
		
		// Boss data
		bossname = "Y.V. Limo";
		boss = true;
		col = c_red;
		
        // this is where you'll set your sprites and such, nts_color_blood isn't needed but makes it work with various blood mods, so its just nice to add.
        // Visuals:
        spr_idle = sprBanditIdle;
		spr_walk = sprBanditWalk;
		spr_hurt = sprBanditHurt
		spr_dead = mskNone;
		spr_fire = mskNone;
		
		sprite_index    = spr_idle;
		depth           = -2;
		hitid           = [sprMutant6Sit, name]
        spr_shadow      = mskNone;	
        nts_color_blood = [c_red, make_color_rgb(134, 44, 35)]
        
        
        // this is where you change your enemy's stats and add any needed variables, most should be self explanatory but if you need help ask.
        // Vars:
        mask_index    = global.mskYVLimo;
        direction     = random(360);
        maxhealth     = 1000 + GameCont.loops*500;
       	my_health     = maxhealth;
        raddrop       = 90;
        maxspeed      = 3.5;
        walkspeed     = maxspeed;
        canmelee      = 1;
        meleedamage   = 2;
        team          = 420;
        targetvisible = 0;
        target        = 0;
        walk          = 0;
        gunangle      = 180;
        fff_bloomamount = 0;
        fff_bloomtransparency = 0.1;
        size = 4;
        corpse = false;
        
        snd_hurt = sndHitMetal;
        snd_mele = sndBigDogHit;
		
		// Limo vars.:
		image_angle = random(360);
		hovertimer = 0;
		targetangle = 0;
		
        // setting your alarm amounts here is basically just how quickly they can attack after spawning, usually just keep it at this amount.
        // if you need something to be able to attack RIGHT after spawning set it to like 10 or something.
        // Alarms:
        alarm1 = 40 + irandom(30);
        
         
        // set you stuff in here, I have some generic things to set, scroll to the bottom of the file to see them if you want.
        // GunEnemy_draw is for drawing an enemy that wields a ranged weapon, theres also BasicEnemy_draw (no weapon) and MeleeEnemy_draw (melee weapon) in this file.
        // Enemy_hurt is just a standard enemy hurt function, replace it if you want a special on_hurt effect.
        // StandardDrops drops what is pretty much a 'Normal' amount of pickups.
        // Alrm1 is where you'll set your actual attacks, you can have more than one alarm but the majority of enemies dont need them and I dont feel like explaining it.
        
        //Scripts:
        on_step  = script_ref_create(YVLimo_step);
        on_draw  = YVLimo_draw;
        on_hurt  = Enemy_hurt;
        on_death = YVLimo_death;
        //on_alrm1 = script_ref_create(WoolyMaggot_alrm1);
        
        return self;
	}

#define YVLimo_step
	speed = 0;
	hovertimer += current_time_scale;
	
	if (array_length(instances_meeting(x, y, Wall)))
	{
		with instance_create(x, y, PortalClear)
		{
			mask_index = other.mask_index
			image_xscale = 1.5;
			image_yscale = 2;
			image_angle = other.image_angle;
		}
	}
	
	if (enemy_target(x, y) && target_visible) targetangle = target_direction;
	else targetangle = image_angle + 90;
	
	if(walk > 0){ walk -= current_time_scale;   speed += walkspeed * current_time_scale;   gunangle = direction }
	if(speed > maxspeed){ speed = maxspeed; }
	
	image_angle += angle_difference(image_angle, targetangle)*0.1;
	image_angle += 180;
	enemy_walk(image_angle, 1);
	
	sprite_index = enemy_sprite;

#define YVLimo_draw
	var _hurt = (sprite_index == spr_hurt && image_index == 0);
	draw_spritestack(_hurt ? global.sprYVLimoHurt : global.sprYVLimo, x, y - sin_wave(8, 16, 0.1, random_range(-.02, .02), hovertimer), image_xscale, image_yscale, image_angle, image_blend, image_alpha, 0.5, _hurt ? c_white : c_black);

#define YVLimo_death
	pickup_drop(40, 15, 4);
	
	with (YVLimoExplo_create(x, y))
	{
		depth		= -2;
		image_angle = other.image_angle;
		hovertimer	= other.hovertimer;
	}
	
#define YVLimoExplo_create(_x, _y)
	with instance_create(_x, _y, CustomObject)
	{
		timer = 0;
		timerscale = 1;
		explos = 10;
		hovertimer = 0;
		on_step = YVLimoExplo_step;
		on_draw = YVLimoExplo_draw;
		
		return self;
	}
	
#define YVLimoExplo_step
	timer += current_time_scale * timerscale;
	
	if (timer % 5 < current_time_scale)
	{
		timer = 0;
		timerscale = random_range(0.8, 1.2);
		explos --;
		
		if (explos)
		{
			sound_play(sndExplosionL);
			repeat(9) { instance_create(x + random_range(-16, 16), y - 8 + random_range(-16, 16), SmallExplosion); }
		}
		else
		{
			sound_play(sndExplosionXL);
			repeat(18)
			{
				var _x = choose(x - 24, x + 24), _y = choose(y - 24, y + 24);
				instance_create(_x + random_range(-16, 16), _y - 8 + random_range(-16, 16), ScorchTop);
			}
			repeat(12) { instance_create(x + random_range(-32, 32), y - 8 + random_range(-32, 32), GroundFlame); }
			
			repeat(11) { instance_create(x + random_range(-20, 20), y - 8 + random_range(-20, 20), SmallExplosion); }
			repeat(5) { instance_create(x + random_range(-12, 12), y  - 8 + random_range(-12, 12), Explosion); }
			
			instance_destroy();
			
			/* ON-DEATH
				Here is the code for the on-death shit. -chomk
			*/
		}
	}


#define YVLimoExplo_draw
	var _hurt = (timer % 5 < current_time_scale);
	draw_spritestack(_hurt ? global.sprYVLimoHurt : global.sprYVLimo, x, y - sin_wave(8, 16, 0.1, 0, hovertimer), image_xscale, image_yscale, image_angle, image_blend, image_alpha, 0.5, _hurt ? c_white : c_black);

//#endregion

//#region FROZEN CITY:
#define WoolyMaggot_create(_x, _y)
	with instance_create(_x, _y, CustomEnemy){
    	
    	// youll want to set the name here, both because I stuck it in hitid and for mod support
    	name = "Wooly Maggot"
    	
    	
        // this is where you'll set your sprites and such, nts_color_blood isn't needed but makes it work with various blood mods, so its just nice to add.
        // Visuals:
        spr_idle = global.sprWoolyMaggotIdle;
		spr_walk = global.sprWoolyMaggotIdle;
		spr_hurt = global.sprWoolyMaggotHurt
		spr_dead = global.sprWoolyMaggotDead;
		spr_fire = global.sprWoolyMaggotCharge;
	
		
		sprite_index    = spr_idle;
		image_speed     = 0.4;
		depth           = -2;
		hitid           = [spr_idle, name]
        spr_shadow      = shd16;	
        nts_color_blood = [c_red, make_color_rgb(134, 44, 35)]
        
        
        // this is where you change your enemy's stats and add any needed variables, most should be self explanatory but if you need help ask.
        // Vars:
        mask_index    = mskMaggot;
        direction     = random(360);
        maxhealth     = 4;
       	my_health     = maxhealth;
        raddrop       = 2;
        charge_time = 0;
        chargespeed   = 5;
        maxspeed      = 2.5;
        walkspeed     = maxspeed;
        charging	  = false;
        canmelee      = 1;
        meleedamage   = 2;
        team          = 1;
        targetvisible = 0;
        target        = 0;
        walk          = 0;
        gunangle      = 180;
        fff_bloomamount = 0;
        fff_bloomtransparency = 0.1;
        
        snd_dead = sndMaggotSpawnDie;

        // setting your alarm amounts here is basically just how quickly they can attack after spawning, usually just keep it at this amount.
        // if you need something to be able to attack RIGHT after spawning set it to like 10 or something.
        // Alarms:
        alarm1 = 20 + irandom(30);

        // set you stuff in here, I have some generic things to set, scroll to the bottom of the file to see them if you want.
        // GunEnemy_draw is for drawing an enemy that wields a ranged weapon, theres also BasicEnemy_draw (no weapon) and MeleeEnemy_draw (melee weapon) in this file.
        // Enemy_hurt is just a standard enemy hurt function, replace it if you want a special on_hurt effect.
        // StandardDrops drops what is pretty much a 'Normal' amount of pickups.
        // Alrm1 is where you'll set your actual attacks, you can have more than one alarm but the majority of enemies dont need them and I dont feel like explaining it.
        
        //Scripts:
        on_step  = script_ref_create(WoolyMaggot_step);
        on_draw  = BasicEnemy_draw;
        on_hurt  = WoolyMaggot_hurt;
        on_death = LowDrops;
        on_alrm1 = script_ref_create(WoolyMaggot_alrm1);
        
        return self;
	}

#define WoolyMaggot_step

    // surprise surprise its actually really simple in this step to the point you probably don't need to touch this.
    // this is just some simple stuff that sets sprites and handles alarms and speed, only touch this if you have extra sprites like charging or whatever.
    // ask me if you think something needs to go in here, if you're making like, a bandit, it shouldn't need to change this.

	 // Alarms:
	if("on_alrm0" in self and alarm0_run) exit;
	if("on_alrm1" in self and alarm1_run) exit;

		// Movement:
	if(walk > 0){ walk -= current_time_scale;   speed += walkspeed * current_time_scale;   gunangle = direction }
	
		//Speed Cap:
	if(speed > maxspeed){ speed = maxspeed; }
	
		  // Animate:
   if (charging == true){
        maxspeed = chargespeed;
       
        charge_time -= current_time_scale;
  
		fff_bloomamount = 1.5;
        
        with instance_create(x, y, PlasmaTrail){
		sprite_index = global.sprStaticTrail;
		}
    
    	if (charge_time <= 0) {
        charging = false;
		}
    }
    if(anim_end){
		    if (!charging) {
		    	maxspeed = walkspeed;
		    	fff_bloomamount = 0;
		    		
		        sprite_index = enemy_sprite;
		    }
    	}	
	
		//Use Your Eyes:
	right = (gunangle + 270) mod 360 > 180 ? 1 : -1;

#define WoolyMaggot_alrm1

    // setting the alarm here is basically just resetting the attack/movement timer.
    // making it set a larger number will make there be a longer delay, think of it just as a timer that ticks down, because thats what it is.
	alarm1 = 40 + irandom(30);

             // makes the enemy look at that dastardly fella.
	if(enemy_target(x, y) and target_visible) {
		enemy_look(target_direction);
		
		    // This makes the enemy walk towards it's target if its too far away.
		if(target_distance > 128){
			alarm1 = 30 + irandom(15);
			enemy_walk(target_direction + orandom(30), alarm1 - 10);
		}
			 // Checks if within range before attacking, most enemies don't actually check for range and just attack at any distance.
		if(target_distance < 128){
			 // Attack:
			 // this check makes their attacks a bit more random, and makes sure they're not too close to the target, remove this if you want.
			 // MOST enemies in the game have a behavorior like this, including short range enemies like gators.
			 // if you dont believe me spawn some snipers or gators and stand right next to them, theyll just try and move away instead of shooting.
			 
			if(chance(3, 4) and (target_distance > 32)){
			    
			    // set the attack timer here if you want to have a different timer from the walkin and such.
				alarm1 = 60 + irandom(30);
				
				image_index = 0;
        		sprite_index = spr_fire;
        		
        		sound_play_pitchvol(sndLightningCannonEnd, 2, 0.5);
				charging = true;
				charge_time = 40;
				enemy_walk(target_direction + orandom(30), alarm1 - 10);
				
		
			}
			
			         // this makes em move away if too close, see where this connects to the target distance check above.
					 // Move Away From Target:
			else{
				alarm1 = 30 + irandom(15);
				enemy_walk(gunangle + 180 + orandom(30), alarm1 - 10);
			}
		}
	}
	    // just walk around like an idiot if you aren't doing anything better
	 // Wander Around Town:
	else{
		enemy_walk(random(360), 30);
		enemy_look(direction);
	}
	
#define WoolyMaggot_hurt(_dmg, _spd, _dir)
    
    sprite_index = spr_hurt;
	image_index  = 0;
	
    var _snd = sound_play_hit(sndPortalLightning1, 0.1);
    audio_sound_gain(_snd, 0.7, 0);
    audio_sound_set_track_position(_snd, 0.1);
    audio_sound_gain(sound_play_hit(sndMaggotBite, 1.5), 1.5, 0.2);
    
    nexthurt   = current_frame + 6;
	my_health -= _dmg;

#define BigWoolyMaggot_create(_x, _y)
	with instance_create(_x, _y, CustomEnemy){
    	
    	// youll want to set the name here, both because I stuck it in hitid and for mod support
    	name = "Big Wooly Maggot"
    	
    	
        // this is where you'll set your sprites and such, nts_color_blood isn't needed but makes it work with various blood mods, so its just nice to add.
        // Visuals:
        spr_idle = global.sprBigWoolyMaggotIdle;
		spr_walk = global.sprBigWoolyMaggotIdle;
		spr_hurt = global.sprBigWoolyMaggotHurt;
		spr_dead = global.sprBigWoolyMaggotDead;
		spr_appear = global.sprBigWoolyMaggotAppear;
		spr_burrow = global.sprBigWoolyMaggotBurrow;
	
		
		sprite_index    = spr_idle;
		image_speed     = 0.4;
		depth           = -2;
		hitid           = [spr_idle, name]
        spr_shadow      = shd64;	
        spr_shadow_y	= -3;
        spr_shadow_x	= -1;
        nts_color_blood = [c_red, make_color_rgb(134, 44, 35)]
       
        
        // this is where you change your enemy's stats and add any needed variables, most should be self explanatory but if you need help ask.
        // Vars:
        mask_index    = mskDogGuardian;
        direction     = random(360);
        maxhealth     = 22;
       	my_health     = maxhealth;
        raddrop       = 10;
        maxspeed      = 2.5;
        walkspeed     = maxspeed;
        charging	  = false;
        canmelee      = 1;
        meleedamage   = 2;
        team          = 1;
        targetvisible = 0;
        target        = 0;
        walk          = 0;
        gunangle      = 180;
        fff_bloomamount = 0;
        fff_bloomtransparency = 0.1;
        
        snd_dead = sndBigMaggotDie;

        // setting your alarm amounts here is basically just how quickly they can attack after spawning, usually just keep it at this amount.
        // if you need something to be able to attack RIGHT after spawning set it to like 10 or something.
        // Alarms:
        alarm1 = 20 + irandom(30);

        // set you stuff in here, I have some generic things to set, scroll to the bottom of the file to see them if you want.
        // GunEnemy_draw is for drawing an enemy that wields a ranged weapon, theres also BasicEnemy_draw (no weapon) and MeleeEnemy_draw (melee weapon) in this file.
        // Enemy_hurt is just a standard enemy hurt function, replace it if you want a special on_hurt effect.
        // StandardDrops drops what is pretty much a 'Normal' amount of pickups.
        // Alrm1 is where you'll set your actual attacks, you can have more than one alarm but the majority of enemies dont need them and I dont feel like explaining it.
        
        //Scripts:
        on_step  = script_ref_create(BigWoolyMaggot_step);
        on_draw  = BasicEnemy_draw;
        on_hurt  = BigWoolyMaggot_hurt;
        on_death = StandardDrops;
        on_alrm1 = script_ref_create(BigWoolyMaggot_alrm1);
        
        return self;
	}

#define BigWoolyMaggot_step

    // surprise surprise its actually really simple in this step to the point you probably don't need to touch this.
    // this is just some simple stuff that sets sprites and handles alarms and speed, only touch this if you have extra sprites like charging or whatever.
    // ask me if you think something needs to go in here, if you're making like, a bandit, it shouldn't need to change this.

	 // Alarms:
	if("on_alrm0" in self and alarm0_run) exit;
	if("on_alrm1" in self and alarm1_run) exit;

		// Movement:
	if(walk > 0){ walk -= current_time_scale;   speed += walkspeed * current_time_scale;   gunangle = direction }
	
		//Speed Cap:
	if(speed > maxspeed){ speed = maxspeed; }
	
		  // Animate:
   sprite_index = enemy_sprite;
	
	
		//Use Your Eyes:
	right = (gunangle + 270) mod 360 > 180 ? 1 : -1;

#define BigWoolyMaggot_alrm1

    // setting the alarm here is basically just resetting the attack/movement timer.
    // making it set a larger number will make there be a longer delay, think of it just as a timer that ticks down, because thats what it is.
	alarm1 = 40 + irandom(30);

             // makes the enemy look at that dastardly fella.
	if(enemy_target(x, y) and target_visible) {
		enemy_look(target_direction);
		
		    // This makes the enemy walk towards it's target if its too far away.
		if(target_distance > 128){
			alarm1 = 30 + irandom(15);
			enemy_walk(target_direction + orandom(30), alarm1 - 10);
		}
			 // Checks if within range before attacking, most enemies don't actually check for range and just attack at any distance.
		if(target_distance < 128){
			 // Attack:
			 // this check makes their attacks a bit more random, and makes sure they're not too close to the target, remove this if you want.
			 // MOST enemies in the game have a behavorior like this, including short range enemies like gators.
			 // if you dont believe me spawn some snipers or gators and stand right next to them, theyll just try and move away instead of shooting.
			 
			if(chance(3, 4) and (target_distance > 32)){
			    
			    // set the attack timer here if you want to have a different timer from the walkin and such.
				alarm1 = 60 + irandom(30);
        		
        		sound_play_pitchvol(sndLightningCannonEnd, 2, 0.5);
				enemy_walk(target_direction + orandom(30), alarm1 - 10);
				
		
			}
			
			         // this makes em move away if too close, see where this connects to the target distance check above.
					 // Move Away From Target:
			else{
				alarm1 = 30 + irandom(15);
				enemy_walk(gunangle + 180 + orandom(30), alarm1 - 10);
			}
		}
	}
	    // just walk around like an idiot if you aren't doing anything better
	 // Wander Around Town:
	else{
		enemy_walk(random(360), 30);
		enemy_look(direction);
	}
	
#define BigWoolyMaggot_hurt(_dmg, _spd, _dir)
    
    sprite_index = spr_hurt;
	image_index  = 0;
	
    var _snd = sound_play_hit(sndPortalLightning1, 0.1);
    audio_sound_gain(_snd, 0.7, 0);
    audio_sound_set_track_position(_snd, 0.1);
    audio_sound_gain(sound_play_hit(sndMaggotBite, 1.5), 1.5, 0.2);
    
    nexthurt   = current_frame + 6;
	my_health -= _dmg;
	
#define WoolyWorm_create(_x, _y)
	with instance_create(_x, _y, CustomEnemy){
    	
    	// youll want to set the name here, both because I stuck it in hitid and for mod support
    	name = "Wooly Worm Maggot"
    	
    	
        // this is where you'll set your sprites and such, nts_color_blood isn't needed but makes it work with various blood mods, so its just nice to add.
        // Visuals:
        spr_idle = sprBigMaggotIdle;
		spr_walk = sprBigMaggotIdle;
		spr_hurt = sprBigMaggotHurt;
		spr_dead = sprBigMaggotDead;
		spr_fly = sprJungleFlyWalk;
		spr_puke =sprJungleFlyIdle;
	
		
		sprite_index    = spr_idle;
		image_speed     = 0.4;
		depth           = -2;
		hitid           = [spr_idle, name]
        spr_shadow      = shd16;	
        nts_color_blood = [c_red, make_color_rgb(134, 44, 35)]
        
        
        // this is where you change your enemy's stats and add any needed variables, most should be self explanatory but if you need help ask.
        // Vars:
        mask_index    = mskMaggot;
        direction     = random(360);
        maxhealth     = 70;
       	my_health     = maxhealth;
        raddrop       = 13;
        maxspeed      = 2.5;
        walkspeed     = maxspeed;
        canmelee      = 1;
        meleedamage   = 3;
        team          = 1;
        targetvisible = 0;
        target        = 0;
        walk          = 0;
        gunangle      = 180;
        fff_bloomamount = 0;
        fff_bloomtransparency = 0.1;
        
        snd_dead = sndMaggotSpawnDie;

        // setting your alarm amounts here is basically just how quickly they can attack after spawning, usually just keep it at this amount.
        // if you need something to be able to attack RIGHT after spawning set it to like 10 or something.
        // Alarms:
        alarm1 = 20 + irandom(30);

        // set you stuff in here, I have some generic things to set, scroll to the bottom of the file to see them if you want.
        // GunEnemy_draw is for drawing an enemy that wields a ranged weapon, theres also BasicEnemy_draw (no weapon) and MeleeEnemy_draw (melee weapon) in this file.
        // Enemy_hurt is just a standard enemy hurt function, replace it if you want a special on_hurt effect.
        // StandardDrops drops what is pretty much a 'Normal' amount of pickups.
        // Alrm1 is where you'll set your actual attacks, you can have more than one alarm but the majority of enemies dont need them and I dont feel like explaining it.
        
        //Scripts:
        on_step  = script_ref_create(WoolyWorm_step);
        on_draw  = BasicEnemy_draw;
        on_hurt  = WoolyWorm_hurt;
        on_death = StandardDrops;
        on_alrm1 = script_ref_create(WoolyWorm_alrm1);
        
        return self;
	}

#define WoolyWorm_step

    // surprise surprise its actually really simple in this step to the point you probably don't need to touch this.
    // this is just some simple stuff that sets sprites and handles alarms and speed, only touch this if you have extra sprites like charging or whatever.
    // ask me if you think something needs to go in here, if you're making like, a bandit, it shouldn't need to change this.

	 // Alarms:
	if("on_alrm0" in self and alarm0_run) exit;
	if("on_alrm1" in self and alarm1_run) exit;

		// Movement:
	if(walk > 0){ walk -= current_time_scale;   speed += walkspeed * current_time_scale;   gunangle = direction }
	
		//Speed Cap:
	if(speed > maxspeed){ speed = maxspeed; }
	
		  // Animate:
   sprite_index = enemy_sprite;
	
	
		//Use Your Eyes:
	right = (gunangle + 270) mod 360 > 180 ? 1 : -1;

#define WoolyWorm_alrm1

    // setting the alarm here is basically just resetting the attack/movement timer.
    // making it set a larger number will make there be a longer delay, think of it just as a timer that ticks down, because thats what it is.
	alarm1 = 40 + irandom(30);

             // makes the enemy look at that dastardly fella.
	if(enemy_target(x, y) and target_visible) {
		enemy_look(target_direction);
		
		    // This makes the enemy walk towards it's target if its too far away.
		if(target_distance > 128){
			alarm1 = 30 + irandom(15);
			enemy_walk(target_direction + orandom(30), alarm1 - 10);
		}
			 // Checks if within range before attacking, most enemies don't actually check for range and just attack at any distance.
		if(target_distance < 128){
			 // Attack:
			 // this check makes their attacks a bit more random, and makes sure they're not too close to the target, remove this if you want.
			 // MOST enemies in the game have a behavorior like this, including short range enemies like gators.
			 // if you dont believe me spawn some snipers or gators and stand right next to them, theyll just try and move away instead of shooting.
			 
			if(chance(3, 4) and (target_distance > 32)){
			    
			    // set the attack timer here if you want to have a different timer from the walkin and such.
				alarm1 = 60 + irandom(30);
        		
        		sound_play_pitchvol(sndLightningCannonEnd, 2, 0.5);
				enemy_walk(target_direction + orandom(30), alarm1 - 10);
				
		
			}
			
			         // this makes em move away if too close, see where this connects to the target distance check above.
					 // Move Away From Target:
			else{
				alarm1 = 30 + irandom(15);
				enemy_walk(gunangle + 180 + orandom(30), alarm1 - 10);
			}
		}
	}
	    // just walk around like an idiot if you aren't doing anything better
	 // Wander Around Town:
	else{
		enemy_walk(random(360), 30);
		enemy_look(direction);
	}
	
#define WoolyWorm_hurt(_dmg, _spd, _dir)
    
    sprite_index = spr_hurt;
	image_index  = 0;
	
    var _snd = sound_play_hit(sndPortalLightning1, 0.1);
    audio_sound_gain(_snd, 0.7, 0);
    audio_sound_set_track_position(_snd, 0.1);
    audio_sound_gain(sound_play_hit(sndMaggotBite, 1.5), 1.5, 0.2);
    
    nexthurt   = current_frame + 6;
	my_health -= _dmg;
//#endregion
//#region MISC:
#define Thief_create(_x, _y)
	with instance_create(_x, _y, CustomEnemy){
    	
    	// youll want to set the name here, both because I stuck it in hitid and for mod support
    	name = "Thief"
    	
    	
        // this is where you'll set your sprites and such, nts_color_blood isn't needed but makes it work with various blood mods, so its just nice to add.
        // Visuals:
        spr_idle = sprJungleBanditIdle;
		spr_walk = sprJungleBanditWalk;
		spr_hurt = sprJungleBanditHurt;
		spr_dead = sprJungleBanditDead;
	
		
		sprite_index    = spr_idle;
		image_speed     = 0.4;
		depth           = -2;
		hitid           = [spr_idle, name]
        spr_shadow      = shd16;	
        nts_color_blood = [c_red, make_color_rgb(134, 44, 35)]
        
        
        // this is where you change your enemy's stats and add any needed variables, most should be self explanatory but if you need help ask.
        // Vars:
        mask_index    = mskMaggot;
        direction     = random(360);
        maxhealth     = 4;
       	my_health     = maxhealth;
        raddrop       = 2;
        maxspeed      = 2.5;
        walkspeed     = maxspeed;
        canmelee      = 1;
        meleedamage   = 2;
        team          = 1;
        targetvisible = 0;
        target        = 0;
        walk          = 0;
        gunangle      = 180;
        fff_bloomamount = 0;
        fff_bloomtransparency = 0.1;
        
        snd_dead = sndMaggotSpawnDie;

        // setting your alarm amounts here is basically just how quickly they can attack after spawning, usually just keep it at this amount.
        // if you need something to be able to attack RIGHT after spawning set it to like 10 or something.
        // Alarms:
        alarm1 = 20 + irandom(30);

        // set you stuff in here, I have some generic things to set, scroll to the bottom of the file to see them if you want.
        // GunEnemy_draw is for drawing an enemy that wields a ranged weapon, theres also BasicEnemy_draw (no weapon) and MeleeEnemy_draw (melee weapon) in this file.
        // Enemy_hurt is just a standard enemy hurt function, replace it if you want a special on_hurt effect.
        // StandardDrops drops what is pretty much a 'Normal' amount of pickups.
        // Alrm1 is where you'll set your actual attacks, you can have more than one alarm but the majority of enemies dont need them and I dont feel like explaining it.
        
        //Scripts:
        on_step  = script_ref_create(Thief_step);
        on_draw  = BasicEnemy_draw;
        on_hurt  = Thief_hurt;
        on_death = LowDrops;
        on_alrm1 = script_ref_create(Thief_alrm1);
        
        return self;
	}

#define Thief_step

    // surprise surprise its actually really simple in this step to the point you probably don't need to touch this.
    // this is just some simple stuff that sets sprites and handles alarms and speed, only touch this if you have extra sprites like charging or whatever.
    // ask me if you think something needs to go in here, if you're making like, a bandit, it shouldn't need to change this.

	 // Alarms:
	if("on_alrm0" in self and alarm0_run) exit;
	if("on_alrm1" in self and alarm1_run) exit;

		// Movement:
	if(walk > 0){ walk -= current_time_scale;   speed += walkspeed * current_time_scale;   gunangle = direction }
	
		//Speed Cap:
	if(speed > maxspeed){ speed = maxspeed; }
	
		  // Animate:
   sprite_index = enemy_sprite;
	
	
		//Use Your Eyes:
	right = (gunangle + 270) mod 360 > 180 ? 1 : -1;

#define Thief_alrm1

    // setting the alarm here is basically just resetting the attack/movement timer.
    // making it set a larger number will make there be a longer delay, think of it just as a timer that ticks down, because thats what it is.
	alarm1 = 40 + irandom(30);

             // makes the enemy look at that dastardly fella.
	if(enemy_target(x, y) and target_visible) {
		enemy_look(target_direction);
		
		    // This makes the enemy walk towards it's target if its too far away.
		if(target_distance > 128){
			alarm1 = 30 + irandom(15);
			enemy_walk(target_direction + orandom(30), alarm1 - 10);
		}
			 // Checks if within range before attacking, most enemies don't actually check for range and just attack at any distance.
		if(target_distance < 128){
			 // Attack:
			 // this check makes their attacks a bit more random, and makes sure they're not too close to the target, remove this if you want.
			 // MOST enemies in the game have a behavorior like this, including short range enemies like gators.
			 // if you dont believe me spawn some snipers or gators and stand right next to them, theyll just try and move away instead of shooting.
			 
			if(chance(3, 4) and (target_distance > 32)){
			    
			    // set the attack timer here if you want to have a different timer from the walkin and such.
				alarm1 = 60 + irandom(30);
        		
        		sound_play_pitchvol(sndLightningCannonEnd, 2, 0.5);
				enemy_walk(target_direction + orandom(30), alarm1 - 10);
				
		
			}
			
			         // this makes em move away if too close, see where this connects to the target distance check above.
					 // Move Away From Target:
			else{
				alarm1 = 30 + irandom(15);
				enemy_walk(gunangle + 180 + orandom(30), alarm1 - 10);
			}
		}
	}
	    // just walk around like an idiot if you aren't doing anything better
	 // Wander Around Town:
	else{
		enemy_walk(random(360), 30);
		enemy_look(direction);
	}
	
#define Thief_hurt(_dmg, _spd, _dir)
    
    sprite_index = spr_hurt;
	image_index  = 0;
	
    var _snd = sound_play_hit(sndPortalLightning1, 0.1);
    audio_sound_gain(_snd, 0.7, 0);
    audio_sound_set_track_position(_snd, 0.1);
    audio_sound_gain(sound_play_hit(sndMaggotBite, 1.5), 1.5, 0.2);
    
    nexthurt   = current_frame + 6;
	my_health -= _dmg;

//#endregion
//#region GENERIC FUNCTIONS


    // These are all some helpful functions and macros, I make use of them a lot .
    // im not going to bother writing about them, if you want to know what does what just ask, although I might not remember since these are snatched from relics iirc.

#macro	bbox_center_x																			(bbox_left + bbox_right + 1) / 2
#macro	bbox_center_y																			(bbox_top + bbox_bottom + 1) / 2
#macro  target_visible                                                                          !collision_line(x, y, target.x, target.y, Wall, false, false)
#macro  target_direction                                                                        point_direction(x, y, target.x, target.y)
#macro  target_distance                                                                         point_distance(x, y, target.x, target.y)
#macro  anim_end																				((image_index + image_speed_raw) >= image_number || (image_index + image_speed_raw) < 0)
#macro  enemy_sprite                                                                            (sprite_index != spr_hurt || anim_end) ? ((speed == 0) ? spr_idle : spr_walk) : sprite_index
#macro  alarm0_run                                                                              alarm0 && !--alarm0 && !--alarm0 && (script_ref_call(on_alrm0) || !instance_exists(self))
#macro  alarm1_run                                                                              alarm1 && !--alarm1 && !--alarm1 && (script_ref_call(on_alrm1) || !instance_exists(self))
#macro  alarm2_run                                                                              alarm2 && !--alarm2 && !--alarm2 && (script_ref_call(on_alrm2) || !instance_exists(self))
#macro  alarm3_run                                                                              alarm3 && !--alarm3 && !--alarm3 && (script_ref_call(on_alrm3) || !instance_exists(self))
#macro  alarm4_run                                                                              alarm4 && !--alarm4 && !--alarm4 && (script_ref_call(on_alrm4) || !instance_exists(self))
#macro  alarm5_run                                                                              alarm5 && !--alarm5 && !--alarm5 && (script_ref_call(on_alrm5) || !instance_exists(self))
#macro  alarm6_run                                                                              alarm6 && !--alarm6 && !--alarm6 && (script_ref_call(on_alrm6) || !instance_exists(self))
#macro  alarm7_run                                                                              alarm7 && !--alarm7 && !--alarm7 && (script_ref_call(on_alrm7) || !instance_exists(self))
#macro  alarm8_run                                                                              alarm8 && !--alarm8 && !--alarm8 && (script_ref_call(on_alrm8) || !instance_exists(self))
#macro  alarm9_run                                                                              alarm9 && !--alarm9 && !--alarm9 && (script_ref_call(on_alrm9) || !instance_exists(self))
#macro  scr 																					global.scr
#macro  call																					script_ref_call
#macro	FloorNormal																				instances_matching(Floor, "object_index", Floor)
#define orandom(_num)                                                                   		return  random_range(-_num, _num);
#define chance(_numer, _denom)                                                          		return  random(_denom) < _numer;
#define chance_ct(_numer, _denom)                                                       		return  random(_denom) < _numer * current_time_scale;
#define angle_lerp_ct(_ang1, _ang2, _num)                                                       return  _ang2 + (angle_difference(_ang1, _ang2) * power(1 - _num, current_time_scale));
#define enemy_walk(_dir, _num)                                                                  direction = _dir; walk = _num; if(speed < friction) speed = friction;
#define enemy_face(_dir)                                                                        _dir = ((_dir % 360) + 360) % 360; if(_dir < 90 || _dir > 270) right = 1; else if(_dir > 90 && _dir < 270) right = -1;
#define enemy_look(_dir)                                                                        _dir = ((_dir % 360) + 360) % 360; if(_dir < 90 || _dir > 270) right = 1; else if(_dir > 90 && _dir < 270) right = -1; if('gunangle' in self) gunangle = _dir;
#define enemy_target(_x, _y)                                                            		target = (instance_exists(Player) ? instance_nearest(_x, _y, Player) : ((instance_exists(target) && target >= 0) ? target : noone)); return (target != noone);
#define BasicEnemy_draw                             											draw_sprite_ext(sprite_index,image_index,x,y,image_xscale * right, image_yscale, image_angle, image_blend, image_alpha);
#define GunEnemy_draw                               											if gunangle < 180{ draw_sprite_ext(spr_weap,0,x + lengthdir_x(-wkick,gunangle), y + lengthdir_y(-wkick, gunangle), 1, right, gunangle, image_blend, image_alpha);} draw_sprite_ext(sprite_index,image_index,x,y,image_xscale * right, image_yscale, image_angle, image_blend, image_alpha); if gunangle >= 180{ draw_sprite_ext(spr_weap,0,x + lengthdir_x(-wkick,gunangle), y + lengthdir_y(-wkick, gunangle), 1, right, gunangle, image_blend, image_alpha);}
#define MeleeEnemy_draw																			if(gunangle <= 180) draw_weapon(spr_weap, 0, x, y, gunangle, wepangle, wkick, 1, image_blend, image_alpha); image_xscale *= right; draw_self(); image_xscale /= right; if(gunangle >  180) draw_weapon(spr_weap, 0, x, y, gunangle, wepangle, wkick, 1, image_blend, image_alpha);
#define StandardDrops                           												pickup_drop(40, 10, 2);
#define LowDrops                           														pickup_drop(40, 0, 2);
#define draw_bloom
    with(instances_matching_gt([CustomProjectile, CustomObject, CustomSlash, CustomEnemy], "fff_bloomamount", 0)){
        draw_sprite_ext(sprite_index, image_index, x, y, fff_bloomamount*image_xscale,  fff_bloomamount*image_yscale, image_angle, image_blend,  fff_bloomtransparency);
    }

#define sin_wave(_from, _to, _dur, _offset, _time)												return _from + ((_to - _from) * 0.5) + sin((((_time * 0.001) + _dur * _offset) / _dur) * (pi * 2)) * ((_to - _from) * 0.5);

#define nothing
//not one thing!

#define enemy_step
	 // Alarms:
	if("on_alrm0" in self and alarm0_run) exit;
	if("on_alrm1" in self and alarm1_run) exit;
	
	 // Movement:
	if(walk > 0){
		walk -= current_time_scale;
		speed += walkspeed * current_time_scale;
	}
	if(speed > maxspeed){
		speed = maxspeed;
	}
	
	 // Animate:
	sprite_index = enemy_sprite;
	
#define Enemy_hurt(_dmg, _spd, _dir)
	sprite_index = spr_hurt;
	image_index  = 0;
	
	sound_play_hit(snd_hurt, 0.3);
	motion_add(_dir, _spd);
	
	nexthurt   = current_frame + 6;
	my_health -= _dmg;


//Snatched from TE
#define draw_weapon(_sprite, _image, _x, _y, _angle, _angleMelee, _kick, _flip, _blend, _alpha)
	/*
		Drawing weapon sprites
		
		Ex:
			draw_weapon(sprBanditGun, gunshine, x, y, gunangle, 0, wkick, right, image_blend, image_alpha)
			draw_weapon(sprPipe, 0, x, y, gunangle, wepangle, wkick, wepflip, image_blend, image_alpha)
	*/
	
	 // Melee Offset:
	if(_angleMelee != 0){
		_angle += _angleMelee * (1 - (_kick / 20));
	}
	
	 // Kick:
	if(_kick != 0){
		_x -= lengthdir_x(_kick, _angle);
		_y -= lengthdir_y(_kick, _angle);
	}
	
	 // Draw:
	draw_sprite_ext(_sprite, _image, _x, _y, 1, _flip, _angle, _blend, _alpha);
	
#define sound_play_hit_ext(_sound, _pitch, _volume)
	/*
		'sound_play_hit()' distance-based sound, but with pitch and volume arguments
	*/
	
	var _snd = sound_play_hit(_sound, 0);
	
	sound_pitch(_snd, _pitch);
	sound_volume(_snd, audio_sound_get_gain(_snd) * _volume);
	
	return _snd;
	
#define instances_inside_rect(_x1, _y1, _x2, _y2, _obj)
	return instances_matching_le(instances_matching_ge(instances_matching_le(instances_matching_ge(_obj, "bbox_right", _x1), "bbox_left", _x2), "bbox_bottom", _y1), "bbox_top", _y2);

#define instances_meeting(_x, _y, _obj)
	var _tx = x, _ty = y;
	x = _x; y = _y;
	var _inst = instances_matching_ne(instances_matching_le(instances_matching_ge(instances_matching_le(instances_matching_ge(_obj, "bbox_right", bbox_left), "bbox_left", bbox_right), "bbox_bottom", bbox_top), "bbox_top", bbox_bottom), "id", id);
	x = _tx; y = _ty;
	    
	return _inst;

#define array_delete(_array, _index)
	var _new = array_slice(_array, 0, _index);
	array_copy(_new, _index, _array, _index + 1, array_length(_array) - (_index + 1));
	return _new;
	
#define draw_spritestack(_sprite, _x, _y, _xscale, _yscale, _angle, _blend, _alpha, _tilt, _outline)
	d3d_set_fog(1, _outline, 0, 0);
	for (var i = 0; i < sprite_get_number(_sprite); i++)
	{
		draw_sprite_ext(_sprite, i, _x, _y-i*_tilt-1, _xscale, _yscale, _angle, _blend, _alpha);
		draw_sprite_ext(_sprite, i, _x, _y-i*_tilt+1, _xscale, _yscale, _angle, _blend, _alpha);
		draw_sprite_ext(_sprite, i, _x+1, _y-i*_tilt, _xscale, _yscale, _angle, _blend, _alpha);
		draw_sprite_ext(_sprite, i, _x-1, _y-i*_tilt, _xscale, _yscale, _angle, _blend, _alpha);
	}
	
	d3d_set_fog(0, 0, 0, 0);
	for(var i = 0; i < sprite_get_number(_sprite); i++)
	{
		draw_sprite_ext(_sprite, i, _x, _y-i*_tilt, _xscale, _yscale, _angle, _blend, _alpha);
	}