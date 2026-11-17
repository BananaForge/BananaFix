# 🍌 BananaFix

**Ein Addon aus der BananaForge, der Addon-Schmiede von Tel'Abims Bananenbande**

BananaFix behebt einen Lua-Fehler im Target-Frame auf **OctoWoW** (WoW 1.12). Installieren, fertig. Kein Menü, keine Einstellungen, keine Bananenschalen im Chat.

---

## 🐛 Das Problem

Wer auf OctoWoW etwas anvisiert, bekommt bei manchen Installationen diese Meldung, oft mehrfach hintereinander:

```
Interface\FrameXML\TargetFrame.lua:291: attempt to index global
'Turtle_ChallengesCache' (a nil value)
```

**Ursache:** OctoWoW ist ein Fork von Turtle WoW und hat dessen `TargetFrame.lua` übernommen. Diese Datei braucht die Tabelle `Turtle_ChallengesCache`, die auf Turtle WoW vom Addon `Turtle_General` angelegt wird. Wer dieses Addon nicht hat (zum Beispiel nach einer frischen Installation), bekommt den Fehler. Deshalb trifft es oft nur einzelne Spieler.

Betroffen sind Windows, Linux und das Steam Deck gleichermaßen.

## ✅ Die Lösung

BananaFix legt die fehlende Tabelle an, bevor der Target-Frame sie braucht.

- Ist die Tabelle schon da (weil `Turtle_General` oder ein anderes Addon sie anlegt), macht BananaFix **gar nichts**.
- Keine Änderung an Spieldateien, nichts in `FrameXML`, nur ein normales Addon.

## 📦 Installation

### Über den OctoLauncher
1. Im OctoLauncher den Bereich **Addons** öffnen.
2. Diesen GitHub-Link einfügen und installieren:
   ```
   https://github.com/BananaForge/BananaFix
   ```
3. Spiel starten. Fertig.

### Manuell
1. Oben auf **Code → Download ZIP** klicken.
2. ZIP entpacken und den Ordner in **`BananaFix`** umbenennen (GitHub hängt sonst `-main` an).
3. Den Ordner nach `World of Warcraft\Interface\AddOns\` kopieren.
   Danach muss es `Interface\AddOns\BananaFix\BananaFix.toc` geben.
4. Im Charakterbildschirm unter **AddOns** prüfen, ob BananaFix aktiviert ist.

### Steam Deck
Im Desktop-Modus genauso wie bei der manuellen Installation. Der AddOns-Ordner liegt je nach Installation (Lutris, Heroic, Proton) an einer anderen Stelle. Am schnellsten findet man ihn im Dateimanager Dolphin über die Suche nach `AddOns`. Versteckte Ordner blendet **Strg+H** ein.

## 💬 Befehle

| Befehl | Wirkung |
|---|---|
| `/bananafix` oder `/bfix` | Zeigt an, ob BananaFix aktiv eingreift oder nicht nötig ist |

## 🍌 Weitere Addons der BananaForge

| Addon | Wofür |
|---|---|
| **BananaCraft** | Berufe und Rezepte der Gilde |
| **BananaLootline** | Gear- und Lootline-Planer |
| **BananaLoot** | Masterloot für Raids |
| **BananaBank** | Gildenbank: Anfragen, Spenden, Ausgaben |
| **BananaFix** | Fehlerbehebung für den OctoWoW-Client |

## 🙏 Danke

- **Chriiger** fürs Melden und geduldige Testen auf Laptop und Steam Deck.
- Die Idee mit der zweistufigen Tabelle stammt aus [OctoChallengesShim](https://github.com/Dinkleberrrg/OctoChallengesShim).

## 📜 Lizenz

MIT, siehe [LICENSE](LICENSE).

---

<p align="center"><i>Geschmiedet in der BananaForge 🔨🍌 · Tel'Abims Bananenbande · OctoWoW</i></p>
