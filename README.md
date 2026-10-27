
# Pokémon Database Exploration — Biology & Identity

> **Scope:** This exploration focuses on Pokémon biology and identity data.
> **Explicit exclusion:** You may **NOT** use items, item categories, pockets, flags, or costs in this exercise.
> **Goal:** Learn to identify obvious relationships in a normalized relational schema and express them using a **single SQL query per question**.

This database is based on the official data model from the Pokémon universe.
You are expected to **read the schema**, not guess table relationships.

---

## Rules

* Each question must be answered using **ONE single SQL query**
* You may use:

  * `SELECT`
  * `WHERE`
  * `INNER JOIN`
  * `GROUP BY`
  * `HAVING`
  * Subqueries (optional)

* You may **NOT** use:

  * `LEFT JOIN`
  * Views
  * Temporary tables
  * Multiple queries

* Output **exactly** what is requested

---

## How to Approach This Exercise

For each question, identify:

1. **The main entity** (what is the “thing”?)
2. **The classification or attribute**
3. **The relationship table (if any)**

Ask yourself:

* Is this a *property*?
* Or a *relationship*?
* Or a *one-to-many mapping*?

---

## Exploration 1 — Pokémon and Species

### Concept

A Pokémon belongs to a species.
Species stores biological traits shared across Pokémon forms.

### Tables Involved

* `pokemon`
* `pokemon_species`

### Question 1

**List the identifiers of all Pokémon whose species is legendary.  Order by speicies id**

#### Output

```
articuno
articuno-galar
azelf
calyrex
calyrex-ice
calyrex-shadow
cobalion
cosmoem
cosmog
cresselia
...
```

---

## Exploration 2 — Pokémon and Types

### Concept

A Pokémon can have **one or two types**.
Types are assigned via a junction table.

### Tables Involved

* `pokemon`
* `pokemon_types`
* `types`

### Question 2

**List all Pokémon identifiers that have exactly two types.**
Sort by Pokémon identifier.  

#### Output (partial)

```
abomasnow|2
abomasnow-mega|2
abra|1
absol|1
absol-mega|1
accelgor|1
aegislash-blade|2
aegislash-shield|2
aerodactyl|2
aerodactyl-mega|2
...
```

---

## Exploration 3 — Counting Relationships

### Concept

Each type can appear on many Pokémon.
We want to **aggregate across a relationship**.

### Tables Involved

* `types`
* `pokemon_types`

### Question 3

**For each type, count how many Pokémon have that type.**
Output the type identifier and the count.
Sort by the pokemon type.

#### Output (partial)

```
bug|93
dark|76
dragon|76
electric|89
fairy|69
fighting|75
fire|84
flying|134
...
```

---

## Exploration 4 — OR Conditions Across Dimensions

### Concept

A Pokémon species can be classified in multiple independent ways:

* Egg group
* Habitat

### Tables Involved

* `pokemon_species`
* `pokemon_species_egg_groups`
* `egg_groups`
* `pokemon_habitats`

### Question 4

**List all Pokémon species that are either:**

* In the `humanshape` egg group
  **OR**
* Found in the `urban` habitat

Ensure no duplicates appear.

#### Output (partial)

```
abra
alakazam
banette
blissey
cacnea
cacturne
chansey
ditto
drowzee
eevee
...
```

---

## Exploration 5 — Hidden Information via Junction Tables

### Concept

Some properties do **not** appear directly on the main table.
You must infer them through relationships.

### Tables Involved

* `pokemon`
* `pokemon_abilities`
* `abilities`

### Question 5

**Show the first Pokémon identifier (ordered by Pokémon identifier) along with their hidden ability name.

Only include Pokémon that have a hidden ability.**

#### Output

```
abomasnow|soundproof
abra|magic-guard
absol|justified
accelgor|unburden
aerodactyl|unnerve
aggron|heavy-metal
aipom|skill-link
alakazam|magic-guard
alcremie|aroma-veil
alomomola|regenerator
...
```

---

## Exploration 6 — Subset of a Subset

### Concept

We now **combine conditions** across multiple joined tables.

### Tables Involved

* `pokemon`
* `pokemon_abilities`
* `pokemon_species`

### Question 6

**How many Pokémon have a hidden ability AND belong to a legendary species?**

#### Output

```
### single number only ###
```

---

## Exploration 7 — Descriptive Multi-Table Output

### Concept

Some queries require both **classification data** and **human-readable descriptions**.

### Tables Involved

* `pokemon_species`
* `pokemon_species_names`
* `pokemon_shapes`
* `pokemon_habitats`
* `pokemon_species_flavor_text`
* `languages`

### Question 7

**List all Pokémon species whose shape is `humanoid`. Order by Species name**
Display:

* Pokémon name (French)
* Shape identifier
* Habitat identifier
* French flavor text

#### Output (partial)

```
Alakazam|humanoid|urban|On dit que les cuillères qu’il tient
en permanence ont été créées
par la puissance de son esprit.
Alakazam|humanoid|urban|On dit que les cuillères qu’il tient
en permanence ont été créées
par la puissance de son esprit.
Alakazam|humanoid|urban|Ses cellules cérébrales se multiplient jusqu’à sa mort.
Il se souvient donc de tout.
Alakazam|humanoid|urban|Son cerveau hors du commun peut effectuer des
opérations à la vitesse d’un ordinateur. Il a un QI
de 5 000.
...
```

---

## Submission Checklist

Before submitting, verify:

* ✅ One query per question
* ✅ No item-related tables used
* ✅ All joins are INNER JOINs
* ✅ Output columns match the question exactly
* ✅ Sorting requirements are respected
* ✅ No duplicate rows unless explicitly required

---

## Why This Exercise Matters

This exploration teaches you how to:

* Read a normalized schema
* Identify relationship tables
* Reason about classification vs attributes
* Infer properties indirectly
* Translate real-world concepts into joins

These skills are **directly transferable** to:

* Exams
* Real databases
* Backend development
* Data engineering work

---

### Final Note

If you find yourself guessing table relationships, stop and **inspect the schema**.

Databases reward precision — not intuition.

Good luck.

# Hand-in

Test your solution by executing the following command on the bash terminal:

```shell
$ pytest
```

When you are satisified, execute the following commands to submit:

```shell
$ git add -A
$ git commit -m 'submit'
$ git push
```
