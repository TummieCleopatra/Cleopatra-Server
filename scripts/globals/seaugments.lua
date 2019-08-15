-------------------------------------------
-- Sea Augments
-- This Function is to calculate Augments
-- for sea gear
-------------------------------------------





function globalStats(player,npc,trade,nqt1,nq2t,nqt3)
  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 60;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (30/55/15)
  local hq2t1 = 35;
  local hq2t2 = 85;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = -1;
  local val2 = -1;


end;



function homamHeadLeafNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamHeadSnowNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamHeadDuskNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 114;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 113;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamHeadLeafHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamHeadSnowHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamHeadDuskHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 114;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 113;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamHeadLeafHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamHeadSnowHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamHeadDuskHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 114;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 113;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

-- HOMAM BODY (STR/DEX or STR/AGI) + Critical Hit Rate


function homamBodyLeafNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- STR/DEX
	    aug1 = 550;
	elseif (augmentopt == 2) then -- STR/AGI
	    aug1 = 552;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamBodySnowNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamBodyDuskNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- STR/VIT
	    aug1 = 551;
	elseif (augmentopt == 2) then -- STR/INT
	    aug1 = 558;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then  -- Phys Damage taken -1~2%
            aug2 = 54;
            val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 54;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamBodyLeafHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- STR/DEX
	    aug1 = 550;
	elseif (augmentopt == 2) then -- STR/AGI
	    aug1 = 552;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamBodySnowHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamBodyDuskHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- STR/VIT
	    aug1 = 551;
	elseif (augmentopt == 2) then -- STR/INT
	    aug1 = 558;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then  -- Phys Damage taken -1~2%
            aug2 = 54;
            val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 54;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamBodyLeafHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- STR/DEX
	    aug1 = 550;
	elseif (augmentopt == 2) then -- STR/AGI
	    aug1 = 552;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamBodySnowHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamBodyDuskHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- STR/VIT
	    aug1 = 551;
	elseif (augmentopt == 2) then -- STR/INT
	    aug1 = 558;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then  -- Phys Damage taken -1~2%
            aug2 = 54;
            val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 54;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

-----------------------------
--       Homam Hands       --
-----------------------------


function homamHandsLeafNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamHandsSnowNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Burst Dmg
	    aug1 = 334;
	elseif (augmentopt == 2) then -- Magic Crit Hit Damage
	    aug1 = 335;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamHandsDuskNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- HP/MP
	    aug1 = 18;
	elseif (augmentopt == 2) then -- Evasion
	    aug1 = 31;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 6) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamHandsLeafHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamHandsSnowHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Burst Dmg
	    aug1 = 334;
	elseif (augmentopt == 2) then -- Magic Crit Hit Damage
	    aug1 = 335;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamHandsDuskHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- HP/MP
	    aug1 = 18;
	elseif (augmentopt == 2) then -- Evasion
	    aug1 = 31;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 6) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamHandsLeafHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamHandsSnowHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Burst Dmg
	    aug1 = 334;
	elseif (augmentopt == 2) then -- Magic Crit Hit Damage
	    aug1 = 335;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamHandsDuskHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- HP/MP
	    aug1 = 18;
	elseif (augmentopt == 2) then -- Evasion
	    aug1 = 31;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 6) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

-----------------------------
--       Homam Legs        --
-----------------------------
function homamLegsLeafNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamLegsSnowNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamLegsDuskNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Defense
	    aug1 = 33;
	elseif (augmentopt == 2) then -- Evasion
	    aug1 = 31;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamLegsLeafHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamLegsSnowHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamLegsDuskHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Defense
	    aug1 = 33;
	elseif (augmentopt == 2) then -- Evasion
	    aug1 = 31;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamLegsLeafHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamLegsSnowHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamLegsDuskHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Defense
	    aug1 = 33;
	elseif (augmentopt == 2) then -- Evasion
	    aug1 = 31;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

-----------------------------
--       Homam Feet        --
-----------------------------

function homamFeetLeafNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then
		    aug2 = 41;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 41;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamFeetSnowNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Enmity -1/2
		    aug2 = 40;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 40;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamFeetDuskNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic dmg taken
	    aug1 = 55;
	elseif (augmentopt == 2) then -- Breath dmg taken
	    aug1 = 56;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Phys Damage Taken
		    aug2 = 54;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 54;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamFeetLeafHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then
		    aug2 = 41;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 41;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamFeetSnowHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Enmity -1/2
		    aug2 = 40;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 40;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamFeetDuskHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 55;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 56;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Magic Damage Taken
		    aug2 = 54;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 54;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamFeetLeafHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 1;
  local hq2t2 = 6;
  local hq2t3 = 40;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
    print(tier)
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then
		    aug2 = 41;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 41;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function homamFeetSnowHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Enmity -1/2
		    aug2 = 40;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 40;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function homamFeetDuskHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 55;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 56;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Magic Damage Taken
		    aug2 = 54;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 54;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

------ NASHIRA GEAR ------



-----------------------------
--      Nashira Head       --
-----------------------------

function nashiraHeadLeafNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraHeadSnowNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraHeadDuskNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 97;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 96;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraHeadLeafHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraHeadSnowHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraHeadDuskHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 97;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 96;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraHeadLeafHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraHeadSnowHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraHeadDuskHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 97;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 96;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

-- nashira BODY (STR/DEX or STR/AGI) + Critical Hit Rate


function nashiraBodyLeafNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- STR/DEX
	    aug1 = 550;
	elseif (augmentopt == 2) then -- STR/AGI
	    aug1 = 552;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraBodySnowNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraBodyDuskNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet: STR
  	    aug1 = 1792;
	elseif (augmentopt == 2) then -- Pet: INT
	    aug1 = 1796;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraBodyLeafHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- STR/DEX
	    aug1 = 550;
	elseif (augmentopt == 2) then -- STR/AGI
	    aug1 = 552;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraBodySnowHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraBodyDuskHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet: STR
  	    aug1 = 1792;
	elseif (augmentopt == 2) then -- Pet: INT
	    aug1 = 1796;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraBodyLeafHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- STR/DEX
	    aug1 = 550;
	elseif (augmentopt == 2) then -- STR/AGI
	    aug1 = 552;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraBodySnowHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraBodyDuskHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet: STR
  	    aug1 = 1792;
	elseif (augmentopt == 2) then -- Pet: INT
	    aug1 = 1796;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 138;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

-----------------------------
--       Nashira Hands     --
-----------------------------


function nashiraHandsLeafNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraHandsSnowNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Burst Dmg
	    aug1 = 334;
	elseif (augmentopt == 2) then -- Magic Crit Hit Damage
	    aug1 = 335;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraHandsDuskNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- HP/MP
	    aug1 = 18;
	elseif (augmentopt == 2) then -- Pet: MAB
	    aug1 = 101;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 6) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraHandsLeafHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraHandsSnowHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Burst Dmg
	    aug1 = 334;
	elseif (augmentopt == 2) then -- Magic Crit Hit Damage
	    aug1 = 335;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraHandsDuskHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- HP/MP
	    aug1 = 18;
	elseif (augmentopt == 2) then -- Pet: MAB
	    aug1 = 101;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 6) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraHandsLeafHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraHandsSnowHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Burst Dmg
	    aug1 = 334;
	elseif (augmentopt == 2) then -- Magic Crit Hit Damage
	    aug1 = 335;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 4) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraHandsDuskHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- HP/MP
	    aug1 = 18;
	elseif (augmentopt == 2) then -- Pet: MAB
	    aug1 = 101;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 6) then
		    aug2 = 49;
		    val2 = 0;
		end
	end
    return aug1, val1, aug2, val2;

end

-----------------------------
--       nashira Legs        --
-----------------------------
function nashiraLegsLeafNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraLegsSnowNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraLegsDuskNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Defense
	    aug1 = 99;
	elseif (augmentopt == 2) then -- Evasion
	    aug1 = 98;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraLegsLeafHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraLegsSnowHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraLegsDuskHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Defense
	    aug1 = 99;
	elseif (augmentopt == 2) then -- Pet Evasion
	    aug1 = 98;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraLegsLeafHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraLegsSnowHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- INT/MND
	    aug1 = 554;
	elseif (augmentopt == 2) then -- INT/MIND/CHR
	    aug1 = 556;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraLegsDuskHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Defense
	    aug1 = 99;
	elseif (augmentopt == 2) then -- Pet Evasion
	    aug1 = 98;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 2;
		elseif (augtier <= nqt3) then
		    val1 = 4;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 3;
		elseif (augtier <= hq1t3) then
		    val1 = 5;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 4;
		elseif (augtier <= hq2t3) then
		    val1 = 6;
        end
        if (val1 == 3) then
		    aug2 = 49;
		    val2 = 0;
        elseif (val1 == 4) then
		    aug2 = 49;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

-----------------------------
--       nashira Feet        --
-----------------------------

function nashiraFeetLeafNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then
		    aug2 = 41;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 41;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraFeetSnowNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Enmity -1/2
		    aug2 = 40;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 40;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraFeetDuskNQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 114;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 113;
	end

    local tier = math.random(1,100);
	if (tier <= nqt1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= nqt2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= nqt3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Magic Damage Taken
		    aug2 = 320;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 320;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraFeetLeafHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then
		    aug2 = 41;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 41;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraFeetSnowHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Enmity -1/2
		    aug2 = 40;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 40;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraFeetDuskHQ(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 114;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 113;
	end

    local tier = math.random(1,100);
	if (tier <= hq1t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq1t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq1t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Blood Pact ability
		    aug2 = 320;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 320;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraFeetLeafHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Attack
	    aug1 = 25;
	elseif (augmentopt == 2) then -- Accuracy
	    aug1 = 23;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then
		    aug2 = 41;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 41;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end


function nashiraFeetSnowHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 95;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Magic Attack
	    aug1 = 133;
	elseif (augmentopt == 2) then -- Magic Acc
	    aug1 = 35;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Enmity -1/2
		    aug2 = 40;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 40;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end

function nashiraFeetDuskHQ2(aug1,val1,aug2,val2)

  -- What is the distubtion that a stone break into specific tiers
  -- i.e NQ stone has a 5% chance to have an augment range of 3-5 for stats
  -- NQ Stones distribution (60/35/5)
  local nqt1 = 45;
  local nqt2 = 60;
  local nqt3 = 100;
  -- HQ+1 Stones Distribution (45/45/10)
  local hq1t1 = 45;
  local hq1t2 = 90;
  local hq1t3 = 100;
  -- HQ+2 Stones Distribution (5/35/60)
  local hq2t1 = 5;
  local hq2t2 = 35;
  local hq2t3 = 100;

  local augmentopt = math.random(1,2); -- Which Augment is it?  There are two possibilities

  local aug1 = -1;
  local val1 = -1;
  local aug2 = 2046;
  local val2 = -1;

	if (augmentopt == 1) then -- Pet Attack
	    aug1 = 114;
	elseif (augmentopt == 2) then -- Pet Acc
	    aug1 = 113;
	end

    local tier = math.random(1,100);
	if (tier <= hq2t1) then
	    local augtier = math.random(1,100);
		if (augtier <= nqt1) then
		    val1 = 0;
		elseif (augtier <= nqt2) then
		    val1 = 1;
		elseif (augtier <= nqt3) then
		    val1 = 2;
        end
	elseif (tier <= hq2t2) then
	    local augtier = math.random(1,100);
		if (augtier <= hq1t1) then
		    val1 = 1;
		elseif (augtier <= hq1t2) then
		    val1 = 2;
		elseif (augtier <= hq1t3) then
		    val1 = 3;
        end
	elseif (tier <= hq2t3) then
	    local augtier = math.random(1,100);
		if (augtier <= hq2t1) then
		    val1 = 2;
		elseif (augtier <= hq2t2) then
		    val1 = 3;
		elseif (augtier <= hq2t3) then
		    val1 = 4;
        end
		if (val1 == 3) then  -- Blood Pact ability
		    aug2 = 320;
		    val2 = 0;
		elseif (val1 == 4) then
		    aug2 = 320;
		    val2 = 1;
		end
	end
    return aug1, val1, aug2, val2;

end