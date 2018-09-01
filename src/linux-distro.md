## Popularity

- https://distrowatch.com/popular

## Centos joins Redhat

- https://www.linuxfoundation.org/blog/2014/01/centos-project-leader-karanbir-singh-opens-up-on-red-hat-deal/

## Debian vs Redhat
	
xchaotic 1 day ago [-]

I'm sure he cares a lot about Debian and a lot of my early learning was on Debian derivatives but I feel that the production server side world has largely standardised on RedHat. Non RedHat/CentOS, non-Ubuntu debian distros are probably a distant fifth in terms of business critical production server so no wonder they were not included in the disclosure early on...
reply

	
jessaustin 1 day ago [-]

Does CentOS get immediate updates like this? My overwhelming impression of that platform is that everything is years out of date... of course maybe that's just the fault of the organizations I've encountered that have used CentOS.
reply

	
kbenson 21 hours ago [-]

What you're likely seeing, and what the siblinb comments are referring to with the "support" you get for years, is that RedHat (and CentOS by extension) do "back-patching", which is to either take the existing patch diff and alter it to work with a slightly older version of the software, apply it and shit that as an update (with the same software version number but increased release number), or to create a wholly new patch to fix it if required and do the same.
This allows you to have a stable "base" with unchanging software requirements, configuration and features to work on for extended periods while also staying very secure, which is why it's favored by enterprises. You can find more information on this on their Life Cycle documentation.[1]

This behavior actually extends to the kernel itself, which is likely why the Debian developer is quotes talking about "the majority of the world runs Debian or they run their own kernel", as Redhat, Fedora, Ubuntu, etc run custom kernels that they've patched. You can see this in different bugfixes for a package, and how they have the same version number for the software, but different release numbers, which come after the version in the filename.[2][3]

There are some more nuances to this model, where you can actually get newer software versions at select points, or where they will actually backport new features and not just bugfixes, but those are somewhat separate, and happen much less frequently (point releases in RHEL terminology).

1: https://access.redhat.com/support/policy/updates/errata/

2: https://access.redhat.com/errata/RHBA-2017:2576

3: https://access.redhat.com/errata/RHBA-2017:2926

reply

	
fl0wenol 22 hours ago [-]

CentOS gets patches as soon as Red Hat publishes the source RPMs upstream or pushes changes to git.centos.org.
What can be confusing about CentOS/RHEL is that many shops using them are on a release that came out years ago. But that's an issue because Red Hat supports 10 year lifecycles for their releases, and will go on supporting them indefinitely if you pay them enough. All the software bundled gets feature and security updates through it's lifecycle, just without changing any interfaces, ABIs, or version numbers. This is great for shops that aren't looking to operate on the bleeding edge and have expensive COTS or bespoke software stacks sitting on top.

Of course, you still have to patch, and organizations can't be forced to do that. Hopefully what you were encountering was just the former and not the latter at those organizations.

	
crankylinuxuser 18 hours ago [-]

I run centos in production. That's because of the following:
     1. SELinux 
     2. OpenSCAP
     3. 99% fit with RedHat
None of the other Linux variants have those tools, or the time put in for compliance goodies. My time == $$$

https://news.ycombinator.com/item?id=17879444

## Debian vs Redhat

01-05-2018 23:53:49
Debian jest najlepszy na serwer, blaszaka i lapka :)
02-05-2018 02:41:00
@satanista Tyle, że na server - stable, a na blaszaka i lapka zdecydowanie wolę sida.
02-05-2018 03:40:42
@satanista 
Na serwer - a w życiu! Nie umywa się nawet do RHEL. Ten bije go na głowę pod każdym względem: stabilne kABI, Red Hat Devtoolset, Red Hat Software Collections, Spacewalk/Satellite, itd. 
Laptop - ha, tym bardziej nie! Pchanie się w archaiczny i przestarzały system na laptopie to proszenie się o kłopoty.
02-05-2018 03:42:15
@overconscious1981 
Debian stable jest zwyczajnie przestarzały i nie oferuje praktycznie żadnych killer features. Gałąź testing i unstable zaś z definicji nie są stabilne, więc nie polecałbym ich nikomu. Używanie czegoś takiego to proszenie się o kłopoty.
02-05-2018 08:42:48
@satanista na serwer? chyba ze mowisz o nasie do domu bo do niczego innego to on sie nie nadaje. podobnie z desktopem, co najwyzej na starsze sprzety..
02-05-2018 09:20:26
@satanista 
akurat na serwer to juz lepiej wziac centosa/rhela badz slesa. 
i wieksza stabilnosc, i wiecej softu od producentow, i wieksze bezpieczenstwo.
02-05-2018 09:49:34
@satanista Na serwer jasne. Na desktop – ani mi się śni
02-05-2018 11:09:32
@RubasznyRumcajs większe bezpieczenstwo? potrafisz to uargumentować czy to puste słowa? Debian ma jedną przewagę nad całą reszta dystrybucji, ogromna społeczność, jeżeli szukasz rozwiązania czy masz jakiś problem to na Debiana znajdziesz odpowiedź w ułamku sekundy
02-05-2018 11:21:57
@Anonim no chyba ze szukasz rozwiazania problemu ktory jest bardziej skomplikowany niz zmiana tapety. 
No, w debianie tak swietnie zajmuja sie bezpieczenstwem, ze dziura w openssl (i to taka ze tylko walnac o sciane ze smiechu) byla tam tylko przez kilka lat, prawda? Czy ow debian dorobil sie chociaz utwardzanych paczek w standardzie (nie, debian hardening guide mnie nie interesuje- bo niby czemu mialbym ja sobie wszystko od zera kompilowac skoro pod innymi nie musze?). O niewlaczanym domyslnie MACu (jakimkolwiek!) nie wspomne. 
A co do dokumentacji- sorry, ale natwet Novell tworzy lepsza przy nowych wydaniach systemu. o RHELu nie wspomne, bo ich dokumentacja jest niemalze wzorcowa.
02-05-2018 12:32:20
@RubasznyRumcajs Mógłbyś uargumentować? 

@que_pasa Nie chce mi się odpowiadać na trolling :P
02-05-2018 13:18:12
@Anonim nigdy nie miałem żadnego problemu znaleść rozwiązane dla manjaro czy samego arch.
02-05-2018 13:53:10
@satanista "@RubasznyRumcajs Mógłbyś uargumentować? " 

 ? 
Brak audytu latek na wazne kompomenty? Tak, sytuacja z openssl to wykazala. 
Brak domyslnie uzywanych opcji, ktore to zwiekszaja bezpieczenstwo uzywanej aplikacji, przy kompilacji (juz chociaz ubuntu je uzywa)? nie ma. 
brak domyslnie dzialajacego i z uzywalnymi zasadami MACa- tak, debian tego nie ma. zainstaluj sobie sam, i sam sie baw z alertami. opensuse, ubuntu uzywaja apparmora, wszystko ze stajni RH- selinuksa. I wszystko jakos dziala. 
A co do dokumentacji- obejrzyj sobie manuale upubliczniane podczas wyjscia dystrybucji. RH a debian to roznica miedzy niebem a pieklem.
02-05-2018 13:54:14
@Anonim "Gałąź testing i unstable zaś z definicji nie są stabilne, więc nie polecałbym ich nikomu. " 

 Jak żyję tak mi się ani razu nie wysypał. Jest dokładnie odwrotnie - działają lepiej od Stable. 
Prosty przykład. Miałem błąd, że jak w LightDM wpisałem złe hasło to nic już potem nie mogłem zrobić (tylko restart). Zainstalowałem LightDM z gałęzi SID i problem zniknął. 
Miałem problem z szarpiącymi filmami. Żadne sztuczki nie mogły rozwiązać problemu. Rozwiązał je dopiero sterownik z gałęzi SID (Unstable). 

To tyle co mam do powiedzenia Unstable vs Stable. Jest dokładnie odwrotnie: w Stable kiblują błędy, które już są dawno poprawione w Sid (Unstable). 

Stable jest dobra tylko na serwery, bo się nie zmienia i jest bezpieczna. Na laptopy i desktopy nadaje się średnio. 

 "Używanie czegoś takiego to proszenie się o kłopoty." 

Ty masz kłopoty sam ze sobą. Ja na wszystkich laptopach i desktopach używam Sida i kłopotów nie mam.
02-05-2018 15:41:30
@RubasznyRumcajs jak nie masz czasu na hardening debiana to stawiasz OpenBSD, tam masz maksymalnie zapięty system OOTB i w zasadzie nie musisz już nic robić poza uszczelnieniem usług, które stawiasz
02-05-2018 15:53:30
@Anonim 
"większe bezpieczenstwo? potrafisz to uargumentować czy to puste słowa?" 
Red Hat realnie zabiega o to aby oprogramowanie zawarte w ich dystrybucji było załatane, nawet jeśli to oni muszą przygotować patche na własną rękę gdyż producent zapomniał już o danym wydaniu. Debian na odwrót - tam króluje zwyczajnie przestarzałe oprogramowanie, którego nikomu nie chce się już łatać. Czasem opiekunowie Debiana próbują coś zdziałać, ale często jest z tego więcej szkody niż pożytku. Kilka lat temu tak "poprawili" openssl, że zaczął generować słabe klucze. Ten problem rozlał się nie tylko na pochodne dystrybucje, ale dotknął znaczną część osób które nawet bezpośrednio z Debiana nie korzystały. Wszak poprawki pakietów w żaden sposób nie wpłyną na już wygenerowane klucze ani na szkody jakie zostały przez nie poczynione. Podobnych wpadek debianowcy mieli jeszcze kilka. Zabierają się za coś o czym nie mają pojęcia. W RH z kolei opiekunami pakietów często są osoby które aktywnie rozwijają dane oprogramowanie (np. gcc). To pozwala na utrzymanie należytej jakości. Czasami można odnieść wrażenie, że w Debianie ogóle nie testują niektórych paczek które trafiają do stabilnej dystrybucji. Buduje się i instaluje = jest dobrze. Nie ważne, że wywala się w produkcji już na najprostszych przykładach. To jest "jakość" Debiana. RH nie odwala takiej fuszerki. 
Ta mityczna społeczność Debiana to jedne z największych kłamstw XXI wieku. Niektórzy opiekunowie są tak leniwi, że nawet gdy im wskażesz błąd, zaproponujesz łatki, to i tak będąc Cię tygodniami olewać, twierdząc, że nie mają czasu bo są zajęci innymi sprawami. I tutaj mamy świetne porównanie jak wygląda rozwijanie systemu po godzinach (Debian) a jak gdy jest to prawdziwa praca (RH).

@que_pasa 
Ewidentnie widać, że nie miałeś żadnej styczności z RHEL. Zanim kolejny raz się ośmieszysz to poczytaj najpierw o SCL i Devtoolset, które zapewniają nowe wersje PHP, Ruby, Python, MariaDB, Apache, itd. a także GCC czy LLVM/Clang toolset. https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/7/html/7.1_release_notes/dts7.1_release#changes-upgrades



@jagth czytać ze zrozumieniem można rzeczy wartościowe - mądrości, rady, a nie rzygi jak twoje czy herr Flicka.
02-05-2018 11:51:35
Fedora ma głupie partycjowanie, że tworzy mi 10 jakichś dziwnych partycji, do tego Chromium jest wykastrowany z kodeków, że nawet filmiki z youtube nie działają. Ach, żeby Linux Mint 19 tak jak 18.04 miał opcję netinstall byłby idealną dystrybucją.
02-05-2018 14:51:59
@Anonim 
"Fedora ma głupie partycjowanie, że tworzy mi 10 jakichś dziwnych partycji" 
Wymień te 10 partycji albo zamknij dziubek, chłopcze. Zresztą, można samemu zadbać o układ partycji, praktycznie jak się chce. Nie trzeba do tego nawet używać instalatora, można sobie wcześniej przygotować LVM, dmcrypt, itd. a instalator Fedory da możliwość skorzystania z tak przygotowanych wolumenów. 

"do tego Chromium jest wykastrowany z kodeków, że nawet filmiki z youtube nie działają." 
Nie jest wykastrowany z kodeków tylko nie zawiera tych o niepewnym statusie prawnym. Fedora ma bardzo restrykcyjną politykę, do tego stopnia, że nie uświadczysz w niej ffmpeg, x264, x265, gstreamer-ffmpeg, gstreamer-plugins-bad, gstreamer-plugins-bad-nonfree, gstreamer-plugins-ugly, itp. Podobnie ma się rzecz z własnościowym sterownikami, Flash Playerem, unrarem, itd. To oprogramowanie można jednak bez problemu pozyskać z repozytorium RPM Fusion. 
Co do Chromium, wystarczy zainstalować chromium-libs-media-freeworld z rpmfusion-free-updates. 

"Ach, żeby Linux Mint 19 tak jak 18.04 miał opcję netinstall byłby idealną dystrybucją." 
Idealną? Chyba dla totalnych amatorów: 
- Brak długotrwałego wsparcia 10+ lat 
- Brak profesjonalnego wsparcia 
- Brak RH Devtoolset 
- Brak RH SCL 
- Brak wsparcia RH Satellite/Spacewalk 
- Brak stabilnego kABI 
- Brak sterowników do profesjonalnego sprzętu 
- Brak łatek kpatch/kGraft/Ksplice/KernelCare 
- Brak zainteresowania tą dystrybucją ze strony poważnych producentów oprogramowania 
- Dziedziczy błędy Ubuntu i Debiana 
- Mierna jakość pakietów 
- Brak zgodności z LSB ;)

[Fedora wydana w terminie, obecnie to najlepszy Linux na laptopy](https://www.dobreprogramy.pl/Fedora-wydana-w-terminie-obecnie-to-najlepszy-Linux-na-laptopy,News,87879.html)


## Humor

LawrenceBDSM 1 dzień 14 godz. temu +10 
bądź linuksiarzem
po tym jak poznajesz DARMOWE OPROGRAMOWANIE dostawaj małpiego rozumu i jaraj się jak dzieciak który odkrył korwina i spisek żydów, ledwo umiesz go zainstalować ale już wiesz że jesteś w elicie i czujesz potrzebę nawracania innych jak weganin
zachęcaj serdecznie każdego do zainstalowania pingwina, jednocześnie bądź napuszonym chujem i po tym jak ktoś się złapie i ma problemy odmawiaj pomocy, rzucaj ogólnikami w stylu "poczytaj", "przecież to proste" i "jak można tego nie wiedzieć" i w końcu "zainstaluj windowsa hyhy"
twierdź że komputer to narzędzie do pracy a gierki są dla gimbusów, jednocześnie od lat szczyć się tym, że udało się odpalić na pingwinie jakiś kilkuletni tytuł (w 20 kl/s i co chwile kraszuje, ale już za parę miesięcy wprowadzimy poprawki)
mitomań na temat swoich kosmicznych zarobków, jednocześnie twierdź że 200 zł za dobrego desktopa raz na kilka lat to "dużo" bo można mieć za darmo, i jaraj się że twój system nie zżera ci zasobów, w czasach kiedy ram kosztuje grosze
narzekaj na m$, jednocześnie jaraj się projektami które mają na celu zrobienie z linucha darmowej kopii windowsa
narzekaj na to że windows nie jest stabilny, że błędy, podczas gdy na na niektórych distro zainstalowanie jebanego sterownika to droga przez mękę i potrafi zająć kilka dni
najbardziej tajemnicza i szalona rzecz jaką zrobiłeś w życiu to seedowanie pornoli, jaraj się że korporacje cię nie szpiegują
uważaj się za lepszego od innych bo poświęcasz większość wolnego czasu na jebanie się z własnym pc

#bekazpodludzi #linux #januszeinformatyki

https://www.wykop.pl/wpis/34833945/badz-linuksiarzem-po-tym-jak-odkrywasz-darmowe-opr/
