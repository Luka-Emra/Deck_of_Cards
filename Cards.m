% Luka Emrashvili
% 823 355 800
% The Deck of cards is ordered from 1 through 52
% Let's define which numbers correspond to Aces, Jacks, Queens and Kings

Aces = [1, 14, 27, 40];
Jacks = [11, 24, 37, 50];
Queens = [12, 25, 38, 51];
Kings = [13, 26, 39, 52];

% Shuffle the deck 1000 times, get the first card and find out if it is a King.

Is_King = 0;

for i = 1 : 1000
    First_Card = randperm(52,1);
    if ismember(First_Card(1), Kings)
        Is_King = Is_King + 1;
    end
end

Is_King_Probability = double(Is_King) / double(1000);

% Shuffle the deck 1000 times, get the first card and find out if it is an Ace, Jack, Queen or King.

Is_Face = 0;

for i = 1 : 1000
    First_Card = randperm(52,1);
    if ismember(First_Card(1), Aces) || ismember(First_Card(1), Jacks) || ismember(First_Card(1), Queens) || ismember(First_Card(1), Kings)
        Is_Face = Is_Face + 1;
    end
end

Is_Face_Probability = double(Is_Face) / double(1000);

% Shuffle the deck 1000 times, get the 1/4 of the deck and from chosen cards find out if 3 of them are Queens.

Is_Queen = 0;
Are_Queens = 0;

for i = 1 : 1000
    Fourth_Deck = randperm(52,13);
    for j = 1 : 13
        if ismember(Fourth_Deck(j), Queens)
            Is_Queen = Is_Queen + 1;
        end
    end
    if Is_Queen == 3
       Are_Queens = Are_Queens + 1; 
    end
    Is_Queen = 0;
end

Are_Queens_Probability = double(Are_Queens) / double(1000);

% Shuffle the deck 1000 times, get the 1/2 of the deck and from chosen
% cards find out if there are 4 Kings.

Is_King = 0;
Are_Kings = 0;

for i = 1 : 1000
    Half_Deck = randperm(52,26);
    for j = 1 : 26
        if ismember(Half_Deck(j), Kings)
            Is_King = Is_King + 1;
        end
    end
    if Is_King == 4
       Are_Kings = Are_Kings + 1; 
    end
    Is_King = 0;
end

Are_Kings_Probability = double(Are_Kings) / double(1000);

disp(Is_King_Probability)
disp(Is_Face_Probability)
disp(Are_Queens_Probability)
disp(Are_Kings_Probability)

Probabilities = [Is_King_Probability Is_Face_Probability Are_Queens_Probability Are_Kings_Probability];
expected_probabilities = [0.0769 0.30769 0.04120 0.05522];


yy=[Probabilities; expected_probabilities];
bar(yy, .70);


