%Semester project

%%1,2

%Reading data from a csv file

installed_capacity = readtable("installedCapPerProdType.csv");
aggregated_energy = readtable("generationPerProdType.csv","Delimiter",",");

% Row of the total aggregated energy over the whole year

%Build in the table containing the total aggregated enrgies over the year.

newAg = aggregated_energy(:,3:end);
newAg_valid = rows2vars(newAg);
matrix = newAg_valid{:,2:end};
total_aggregated_energy = sum(matrix,2,'omitnan');

rows = newAg_valid{:,1};

aggregated_list = table(total_aggregated_energy,'RowNames',rows)


%Printing the data in decending order 
%For Insatlled capacities

sort_Installed = sortrows(installed_capacity,"x2023_MW_",'descend');
disp(sort_Installed);

%For Aggregated Energy
sort_Aggregated = sortrows(aggregated_list,"total_aggregated_energy",'descend');
disp(sort_Aggregated);

%Rearranging the data in decending order with total aggregate



%Finding the aggregate of the energy

%aggregate = sum(installed_capacity{:,2});
%disp(aggregate);

%% 03
% top production type

[top_production_installed_capacity, index1] = max(installed_capacity{1:20,2})
[top_production_aggregated_energy,index2] = max(total_aggregated_energy)

% to get the energy name of the top production for installed capacity

top_name_installed = installed_capacity{index1,1}

% the name of the top_aggregated energy 

top_name_aggregated_energy = newAg_valid{index2,1}



% diffrence to top production type because they are not the same

difference_top_production = top_production_aggregated_energy - top_production_installed_capacity


%% 04
%Plotting 

%x1 = ["Biomass","Fossil Brown coal/Lignite","Fossil Coal-derived gas","Fossil Gas","Fossil Hard coal","Fossil Oil","Fossil Oil shale","Fossil Peat","Geothermal", "Hydro Pumped Storage","Hydro Run-of-river and poundage","Hydro Water Reservoir","Marine","Nuclear","Other","Other renewable","Solar","Waste","Wind Offshore","Wind Onshore","Total Grand capacity"];



% coordinates for the second barchart
x2 = 1:16;
name_aggregated_energy = newAg_valid{:,1}; 
y2 = aggregated_list{:,"total_aggregated_energy"};

% coordinates for the first barchart
name_energy_source = installed_capacity{:,1};
value_energy_source = installed_capacity{:,2};
x = (1:length(value_energy_source));

% split the two bars into two figures 
figure(1);

bar(x,value_energy_source)
set(gca, 'XTick', 1:length(name_energy_source),'XTickLabel',name_energy_source)

figure(2);

bar(x2,y2)
set(gca,'XTick',1:16,'XTickLabel',name_aggregated_energy)
%%


%%
% Total energy capacities for renewable and non renewable types
%Renewable
total_energy_list = installed_capacity{:,2};
disp(total_energy_list)

%% 05
%Energy capacities for renewable and non-renewable

Tinstalled_capacity = installed_capacity(:,2)

renewable = Tinstalled_capacity([1 9 10 11 12 16 17 18 19 20],:)
total_renewable_energy = sum(renewable{:,1})

non_renewable = Tinstalled_capacity([2 3 4 5 6 7 8 14 15],:)
total_non_renewable_energy = sum(non_renewable{:,1})

%% 06

%Reading data from a csv file

Taggregated_energy = aggregated_list{:,"total_aggregated_energy"};

% total aggregated_renewable_energy 
renewable_aggregated = Taggregated_energy([1 6 7 8 9 16 15 13 14 12])
total_renewable_aggregated = sum(renewable_aggregated(:,1))

% total aggregated_non_renewable_energy 
non_renewable_aggregated = Taggregated_energy([2 3 4 5 10 11])
total_non_renewable_aggregated = sum(non_renewable_aggregated(:,1))





%% 07 

% one figure containing two bargraphs

x3 = 1:2;
average_aggregated_renewable =  mean(renewable_aggregated(:,1))
average_aggregated_non_renewable = mean(non_renewable_aggregated(:,1))
y3 = [average_aggregated_renewable,average_aggregated_non_renewable];
names_average = {'renewable'; 'non_renewable'};

figure(3);


bar(x3,y3)
set(gca, 'XTick', 1:2,'XTickLabel',names_average)

%% 08

% reasample the dataset from the aggregated energy into a 1 hour samping rate
dataset = readmatrix("generationPerProdType.csv","Delimiter",",");

z = resample(dataset,4,1);





%% 09

ReadBinaryFile("matrix.csv")
