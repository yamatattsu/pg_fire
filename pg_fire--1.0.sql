\echo Use "CREATE EXTENSION pg_fire" to load this file. \quit

CREATE OR REPLACE PROCEDURE createPalette()
AS $$
	DECLARE
		var_start integer;
	BEGIN
		drop table if exists palette;
		create unlogged table palette (num smallint, esc varchar);
		insert into palette (num, esc)
		values (0, E'\x1B[38;2;0;0;0m■'),
		(1, E'\x1B[38;2;4;0;0m■'),
		(2, E'\x1B[38;2;8;0;0m■'),
		(3, E'\x1B[38;2;12;0;0m■'),
		(4, E'\x1B[38;2;16;0;0m■'),
		(5, E'\x1B[38;2;20;0;0m■'),
		(6, E'\x1B[38;2;24;1;1m■'),
		(7, E'\x1B[38;2;28;1;0m■'),
		(8, E'\x1B[38;2;32;2;0m■'),
		(9, E'\x1B[38;2;36;2;0m■'),
		(10, E'\x1B[38;2;40;2;0m■'),
		(11, E'\x1B[38;2;44;4;0m■'),
		(12, E'\x1B[38;2;48;4;0m■'),
		(13, E'\x1B[38;2;52;4;0m■'),
		(14, E'\x1B[38;2;56;6;0m■'),
		(15, E'\x1B[38;2;60;7;0m■'),
		(16, E'\x1B[38;2;64;7;0m■'),
		(17, E'\x1B[38;2;68;9;0m■'),
		(18, E'\x1B[38;2;72;10;0m■'),
		(19, E'\x1B[38;2;76;10;0m■'),
		(20, E'\x1B[38;2;80;13;0m■'),
		(21, E'\x1B[38;2;84;13;0m■'),
		(22, E'\x1B[38;2;88;14;0m■'),
		(23, E'\x1B[38;2;92;17;0m■'),
		(24, E'\x1B[38;2;96;18;0m■'),
		(25, E'\x1B[38;2;100;18;0m■'),
		(26, E'\x1B[38;2;104;22;0m■'),
		(27, E'\x1B[38;2;108;22;0m■'),
		(28, E'\x1B[38;2;112;23;0m■'),
		(29, E'\x1B[38;2;116;27;0m■'),
		(30, E'\x1B[38;2;120;28;0m■'),
		(31, E'\x1B[38;2;124;29;0m■'),
		(32, E'\x1B[38;2;128;33;0m■'),
		(33, E'\x1B[38;2;132;34;0m■'),
		(34, E'\x1B[38;2;136;35;0m■'),
		(35, E'\x1B[38;2;140;39;0m■'),
		(36, E'\x1B[38;2;144;40;0m■'),
		(37, E'\x1B[38;2;148;41;0m■'),
		(38, E'\x1B[38;2;152;46;0m■'),
		(39, E'\x1B[38;2;156;47;0m■'),
		(40, E'\x1B[38;2;160;48;0m■'),
		(41, E'\x1B[38;2;164;54;0m■'),
		(42, E'\x1B[38;2;168;55;0m■'),
		(43, E'\x1B[38;2;172;56;0m■'),
		(44, E'\x1B[38;2;176;62;0m■'),
		(45, E'\x1B[38;2;180;63;0m■'),
		(46, E'\x1B[38;2;184;64;0m■'),
		(47, E'\x1B[38;2;188;70;0m■'),
		(48, E'\x1B[38;2;192;72;0m■'),
		(49, E'\x1B[38;2;196;73;0m■'),
		(50, E'\x1B[38;2;200;80;0m■'),
		(51, E'\x1B[38;2;204;81;0m■'),
		(52, E'\x1B[38;2;208;83;0m■'),
		(53, E'\x1B[38;2;212;89;0m■'),
		(54, E'\x1B[38;2;216;91;0m■'),
		(55, E'\x1B[38;2;220;93;0m■'),
		(56, E'\x1B[38;2;224;100;0m■'),
		(57, E'\x1B[38;2;228;101;0m■'),
		(58, E'\x1B[38;2;232;103;0m■'),
		(59, E'\x1B[38;2;236;111;0m■'),
		(60, E'\x1B[38;2;240;112;0m■'),
		(61, E'\x1B[38;2;244;114;0m■'),
		(62, E'\x1B[38;2;248;122;0m■'),
		(63, E'\x1B[38;2;252;124;0m■'),
		(64, E'\x1B[38;2;255;126;0m■'),
		(65, E'\x1B[38;2;255;134;4m■'),
		(66, E'\x1B[38;2;254;136;9m■'),
		(67, E'\x1B[38;2;254;138;13m■'),
		(68, E'\x1B[38;2;254;145;17m■'),
		(69, E'\x1B[38;2;254;147;21m■'),
		(70, E'\x1B[38;2;255;149;25m■'),
		(71, E'\x1B[38;2;255;156;29m■'),
		(72, E'\x1B[38;2;255;158;32m■'),
		(73, E'\x1B[38;2;255;160;36m■'),
		(74, E'\x1B[38;2;255;166;41m■'),
		(75, E'\x1B[38;2;255;168;45m■'),
		(76, E'\x1B[38;2;255;170;48m■'),
		(77, E'\x1B[38;2;255;176;52m■'),
		(78, E'\x1B[38;2;255;178;57m■'),
		(79, E'\x1B[38;2;255;179;61m■'),
		(80, E'\x1B[38;2;255;185;65m■'),
		(81, E'\x1B[38;2;255;187;68m■'),
		(82, E'\x1B[38;2;254;188;73m■'),
		(83, E'\x1B[38;2;254;194;77m■'),
		(84, E'\x1B[38;2;254;195;81m■'),
		(85, E'\x1B[38;2;254;196;85m■'),
		(86, E'\x1B[38;2;255;202;89m■'),
		(87, E'\x1B[38;2;255;203;93m■'),
		(88, E'\x1B[38;2;255;204;97m■'),
		(89, E'\x1B[38;2;255;209;100m■'),
		(90, E'\x1B[38;2;255;210;105m■'),
		(91, E'\x1B[38;2;255;212;109m■'),
		(92, E'\x1B[38;2;255;216;113m■'),
		(93, E'\x1B[38;2;255;217;116m■'),
		(94, E'\x1B[38;2;255;218;121m■'),
		(95, E'\x1B[38;2;255;222;125m■'),
		(96, E'\x1B[38;2;255;223;129m■'),
		(97, E'\x1B[38;2;255;224;132m■'),
		(98, E'\x1B[38;2;254;228;137m■'),
		(99, E'\x1B[38;2;254;229;141m■'),
		(100, E'\x1B[38;2;254;230;145m■'),
		(101, E'\x1B[38;2;254;233;149m■'),
		(102, E'\x1B[38;2;255;234;153m■'),
		(103, E'\x1B[38;2;255;235;157m■'),
		(104, E'\x1B[38;2;255;238;161m■'),
		(105, E'\x1B[38;2;255;239;164m■'),
		(106, E'\x1B[38;2;255;239;169m■'),
		(107, E'\x1B[38;2;255;242;173m■'),
		(108, E'\x1B[38;2;255;243;177m■'),
		(109, E'\x1B[38;2;255;243;180m■'),
		(110, E'\x1B[38;2;255;245;185m■'),
		(111, E'\x1B[38;2;255;246;189m■'),
		(112, E'\x1B[38;2;255;246;193m■'),
		(113, E'\x1B[38;2;255;248;196m■'),
		(114, E'\x1B[38;2;254;249;201m■'),
		(115, E'\x1B[38;2;254;249;205m■'),
		(116, E'\x1B[38;2;254;251;209m■'),
		(117, E'\x1B[38;2;254;251;213m■'),
		(118, E'\x1B[38;2;255;251;217m■'),
		(119, E'\x1B[38;2;255;253;221m■'),
		(120, E'\x1B[38;2;255;253;225m■'),
		(121, E'\x1B[38;2;255;253;228m■'),
		(122, E'\x1B[38;2;255;254;233m■'),
		(123, E'\x1B[38;2;255;254;237m■'),
		(124, E'\x1B[38;2;255;254;241m■'),
		(125, E'\x1B[38;2;255;254;244m■'),
		(126, E'\x1B[38;2;255;254;249m■'),
		(127, E'\x1B[38;2;255;254;253m■');
	END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE initFiredata(var_height integer, var_width integer)
AS $$
	BEGIN
		drop table if exists fire_data;
		create unlogged table fire_data (data integer[][]);
		insert into fire_data(data) select array_fill(0, ARRAY[var_height, var_width]);
	END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE pilotLight(var_height integer, var_width integer)
AS $$
	BEGIN
		update fire_data set data[var_height:var_height] =
		array((select (round((random() * -127)::smallint, 0) + 127) from generate_series(1, var_width)));
	END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE applyFilter(var_height integer, var_width integer)
AS $$
	BEGIN
		create table temp as 
			with foo(y, data) as 
			(
				select y, 
                       array_agg(trunc((data["y+1"]["x-1"] + data["y+1"][x] + data["y+1"]["x+1"] + data["y+2"][x]) * 0.2499)) as data
				from 
				    (select y, 
				            (y+1) as "y+1", 
				            (case when (y+2) > var_height then 1 else (y+2) end) as "y+2",
				            (case when ((x-1 + var_width) % var_width) = 0 then var_width else ((x-1 + var_width) % var_width) end) as "x-1",
				            (case when (x) % var_width = 0 then var_width else (x) end) as "x",
				            (case when (x+1) > var_width then 1 else (x+1) end) as "x+1"
				     from generate_series(1, var_height - 1) as y, generate_series(1, var_width) as x
				    ) as hoge,
				    fire_data
				group by y
				order by y
			),
			bar(y, i) as
			(
				select y,
			           unnest(data) as i
				from   foo
				union all
				select var_height,
				       unnest(data[var_height:var_height])
				from fire_data
			),
			yeah(data) as
			(
				select array_agg(b.i) as data
				from   bar as b
				group by b.y
				order by b.y
			)
			select array_agg(data) as data
			from yeah;

		--新旧データを入れ替える
		truncate fire_data;
		insert into fire_data select * from temp;
		drop table temp;
	END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE pg_fire(var_h integer, var_w integer) 
AS $$
	DECLARE
		var_height integer;
		var_width  integer;
		var_start  integer;
		var_end    integer;
		var_sql    text;
		var_out text;
	BEGIN
		var_height := var_h;
		var_width  := var_w;
		var_start  := 1;
		var_end    := 10000;
		var_sql    := 'select * from updateDisp3('|| var_height || ',' || var_width || ')';

		PERFORM '\pset format unaligned';
		call clear();

		call createPalette();

		call initFiredata(var_height, var_width);

		FOR var_i IN var_start..var_end LOOP
			call pilotLight(var_height, var_width);

			call applyFilter(var_height, var_width);

			EXECUTE var_sql INTO var_out;
			RAISE INFO '%', E'\x1b[1;1H' || var_out;

		END LOOP;

		drop table fire_data, palette;
		call clear();
		PERFORM '\pset format aligned';

	EXCEPTION
		WHEN QUERY_CANCELED THEN
			RAISE INFO '%', E'\x1b[?25h' || E'\x1B[0m';
	END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE clear()
AS $$
	BEGIN
		RAISE INFO '%', E'\x1B[2J' || E'\x1B[0m' || E'\x1b[?25h';
	END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION updateDisp3(var_height integer, var_width integer)
RETURNS TEXT
AS $$
	DECLARE
		var_sql text;
		var_out text;
	BEGIN
		var_sql := 'select array_to_string(bar2, '''') from '
						'(select array_agg(bar) as bar2 from '
							'(select (string_agg(p.esc, '''') || chr(10)) as bar from (select x, unnest(data[1:][x:x]) as i from fire_data, generate_series(1, ' || var_width || ') as x) as foo, '
										'palette p '
										'where foo.i = p.num '
										'group by x '
										'order by x) as yeah'
						') as mumumu';
		EXECUTE var_sql INTO var_out;
		RETURN var_out;
	END;
$$ LANGUAGE plpgsql;
