drop table if exists traits;
create table traits (
    id integer primary key autoincrement not null,

    name text unique not null,
    info text default null,
    blurb text default null,

    cost integer not null,

    leveled boolean not null default 0,
    max_level integer default null check(max_level > 0),

    parent_trait text default null,
    foreign key(parent_trait) references traits(name),
    level_rank integer default null
);
drop table if exists trait_prereqs;
create table trait_prereqs (
    trait text not null,
    foreign key(trait) references traits(name),
    prereq text not null,
    foreign key(prereq) references prereqs(name)
);
drop table if exists trait_tags;
create table trait_tags (
    trait text not null,
    foreign key(trait) references traits(name),
    tag text not null,
    foreign key(tag) references tags(name)
);
drop table if exists trait_mods;
create table trait_mods (
    trait text not null,
    foreign key(trait) references traits(name),
    mod text not null,
    foreign key(mod) references modifiers(name)
);

drop table if exists attributes;
create table attributes (
    id integer primary key autoincrement not null,

    name text unique not null,
    info text default null,
    blurb text default null,

    cost integer not null check(cost >= 0),

    min integer default null,
    max integer default null,

    base text not null default '10'
);
drop table if exists attr_prereqs;
create table attr_prereqs (
    attr text not null,
    foreign key(attr) references attributes(name),
    prereq text not null,
    foreign key(prereq) references prereqs(name)
);
drop table if exists attr_tags;
create table attr_tags (
    attr text not null,
    foreign key(attr) references attributes(name),
    tag text not null,
    foreign key(tag) references tags(name)
);
drop table if exists attr_mods;
create table attr_mods (
    attr text not null,
    foreign key(attr) references attributes(name),
    mod text not null,
    foreign key(mod) references modifiers(name)
);

drop table if exists modifiers;
create table modifiers (
    id integer primary key autoincrement not null,

    name text unique not null,
    info text default null,
    blurb text default null,

    cost_mod text not null,

    leveled boolean not null default 0,
    max_level integer default null check(max_level > 0),

    scale_by_attr text default null,
    foreign key(scale_by_attr) references attributes(name),
    scale_by_attr_base integer default null
);
drop table if exists mod_prereqs;
create table mod_prereqs (
    mod text not null,
    foreign key(mod) references modifiers(name),
    prereq text not null,
    foreign key(prereq) references prereqs(name)
);
drop table if exists mod_tags;
create table mod_tags (
    mod text not null,
    foreign key(mod) references modifiers(name),
    tag text not null,
    foreign key(tag) references tags(name)
);

drop table if exists skills;
create table skills (
    id integer primary key autoincrement not null,

    name text unique not null,
    info text default null,
    blurb text default null,

    base_attr text not null,
    foreign key(base_attr) references attributes(name),
    difficulty integer not null,
    foreign key(difficulty) references skill_diffs(id),

    tl_based boolean not null default 0,

    specialty boolean not null default 0,
    parent_skill text default null,
    foreign key(parent_skill) references skills(name)
);
drop table if exists skill_diffs;
create table skill_diffs (
    id integer primary key not null,

    name text unique not null,
    info text default null,
    blurb text default null
);
drop table if exists skill_prereqs;
create table skill_prereqs (
    skill text not null,
    foreign key(skill) references skills(name),
    prereq text not null,
    foreign key(prereq) references prereqs(name)
);
drop table if exists skill_tags;
create table skill_tags (
    skill text not null,
    foreign key(skill) references skills(name),
    tag text not null,
    foreign key(tag) references tags(name)
);
drop table if exists skill_defaults;
create table skill_defaults (
    id integer primary key not null autoincrement,

    skill text not null,
    foreign key(skill) references skills(name),

    base_skill text default null,
    foreign key(skill) references skills(name),
    base_skill_tl integer default null,

    base_attr text default null,
    foreign key(attr) references attributes(name),

    base_rank integer not null
);

drop table if exists tags;
create table tags (
    id integer primary key not null autoincrement,

    name text unique not null,
    info text default null
);

drop table if exists prereqs;
create table prereqs (
    id integer primary key not null autoincrement,

    name text unique not null,
    info text default null,

    req_script text not null
);

drop table if exists templates;
create table templates (
    id integer primary key not null autoincrement,

    name text unique not null,
    info text default null,
    blurb text default null,

    enforce boolean default 0,
    count_disads_limit boolean default 1
);
drop table if exists template_tags;
create table template_tags (
    template text not null,
    foreign key(template) references templates(name),
    tag text not null,
    foreign key(tag) references tags(name)
);

drop table if exists characters;
create table characters (
    id integer primary key not null autoincrement,

    name text not null,

    parent_character text default null,
    foreign key(parent_character) references characters(name),

    player text default null,
    foreign key(player) references players(name)
);
create table character_attrs (
    id integer primary key not null autoincrement,

    character text not null,
    foreign key(character) references characters(name),
    attr text not null,
    foreign key(attr) references attributes(name),

    rank integer not null
);
create table character_traits (
    id integer primary key not null autoincrement,

    character text not null,
    foreign key(character) references characters(name),
    trait text not null,
    foreign key(trait) references traits(name),

    rank integer default null
);
create table character_skills (
    character text not null,
    foreign key(character) references characters(name),
    skill text not null,
    foreign key(skill) references skills(name),

    rank integer not null,
    default integer not null,
    foreign key(default) references skill_defaults(id)
);
drop table if exists character_tags;
create table character_tags (
    character text not null,
    foreign key(character) references characters(name),
    tag text not null,
    foreign key(tag) references tags(name)
);
drop table if exists character_templates;
create table character_templates (
    character text not null,
    foreign key(character) references characters(name),
    template text not null,
    foreign key(template) references templates(name)
);

drop table if exists players;
create table players (
    id integer primary key not null autoincrement,

    name text not null unique
);
