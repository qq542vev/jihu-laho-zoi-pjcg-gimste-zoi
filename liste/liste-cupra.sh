#!/usr/bin/env sh

# sh liste-cupra.sh

cd "$(dirname "${0}")"

awkScript=$(
	cat <<-'EOF'
	BEGIN {
		FS = "\",\""
		meixipa = split("", klesixipa)
		split("", suho_namcu)

		suho_namcu["A1"] = "145"
		suho_namcu["A1::ペア・ワード"] = "58"
		suho_namcu["A1::カテゴリ・ワード"] = "60"
		suho_namcu["A1::カテゴリ・ワード::体の部位"] = "14"
		suho_namcu["A1::カテゴリ・ワード::図形"] = "5"
		suho_namcu["A1::カテゴリ・ワード::色"] = "8"
		suho_namcu["A1::カテゴリ・ワード::植物"] = "5"
		suho_namcu["A1::カテゴリ・ワード::床"] = "3"
		suho_namcu["A1::カテゴリ・ワード::空"] = "4"
		suho_namcu["A1::カテゴリ・ワード::東西南北"] = "4"
		suho_namcu["A1::カテゴリ・ワード::上下左右前後"] = "6"
		suho_namcu["A1::カテゴリ・ワード::朝昼晩夜"] = "4"
		suho_namcu["A1::カテゴリ・ワード::春夏秋冬"] = "4"
		suho_namcu["A1::カテゴリ・ワード::姿勢"] = "3"
		suho_namcu["A1::etc"] = "27"
		suho_namcu["B1"] = "101"
		suho_namcu["B1::ペア・ワード"] = "24"
		suho_namcu["B1::カテゴリ・ワード"] = "50"
		suho_namcu["B1::カテゴリ・ワード::文法用語"] = "11"
		suho_namcu["B1::カテゴリ・ワード::物質の三態"] = "3"
		suho_namcu["B1::カテゴリ・ワード::容器"] = "8"
		suho_namcu["B1::カテゴリ・ワード::乗り物"] = "5"
		suho_namcu["B1::カテゴリ・ワード::店・建物・場所"] = "6"
		suho_namcu["B1::カテゴリ・ワード::所在"] = "2"
		suho_namcu["B1::カテゴリ・ワード::実行"] = "2"
		suho_namcu["B1::カテゴリ・ワード::理由"] = "4"
		suho_namcu["B1::カテゴリ・ワード::道"] = "2"
		suho_namcu["B1::カテゴリ・ワード::水辺"] = "2"
		suho_namcu["B1::カテゴリ・ワード::ご飯"] = "3"
		suho_namcu["B1::カテゴリ・ワード::見る"] = "2"
		suho_namcu["B1::etc"] = "27"
		suho_namcu["C1"] = "114"
		suho_namcu["C1::ペア・ワード"] = "24"
		suho_namcu["C1::カテゴリ・ワード"] = "50"
		suho_namcu["C1::カテゴリ・ワード::時間"] = "8"
		suho_namcu["C1::カテゴリ・ワード::笑い"] = "3"
		suho_namcu["C1::カテゴリ・ワード::味"] = "4"
		suho_namcu["C1::カテゴリ・ワード::作成"] = "2"
		suho_namcu["C1::カテゴリ・ワード::恐怖感情"] = "2"
		suho_namcu["C1::カテゴリ・ワード::興味喚起"] = "4"
		suho_namcu["C1::カテゴリ・ワード::配送"] = "3"
		suho_namcu["C1::カテゴリ・ワード::依頼"] = "2"
		suho_namcu["C1::カテゴリ・ワード::集団"] = "3"
		suho_namcu["C1::カテゴリ・ワード::結合"] = "2"
		suho_namcu["C1::カテゴリ・ワード::変化"] = "2"
		suho_namcu["C1::カテゴリ・ワード::単位"] = "3"
		suho_namcu["C1::カテゴリ・ワード::破壊"] = "6"
		suho_namcu["C1::カテゴリ・ワード::許す"] = "2"
		suho_namcu["C1::カテゴリ・ワード::表面"] = "4"
		suho_namcu["C1::etc"] = "40"
		suho_namcu["D1"] = "159"
		suho_namcu["D1::ペア・ワード"] = "22"
		suho_namcu["D1::カテゴリ・ワード"] = "64"
		suho_namcu["D1::カテゴリ・ワード::動物"] = "9"
		suho_namcu["D1::カテゴリ・ワード::飲み物"] = "7"
		suho_namcu["D1::カテゴリ・ワード::音"] = "3"
		suho_namcu["D1::カテゴリ・ワード::命題感情"] = "5"
		suho_namcu["D1::カテゴリ・ワード::集団"] = "3"
		suho_namcu["D1::カテゴリ・ワード::関連"] = "2"
		suho_namcu["D1::カテゴリ・ワード::命令"] = "4"
		suho_namcu["D1::カテゴリ・ワード::色"] = "3"
		suho_namcu["D1::カテゴリ・ワード::類似"] = "3"
		suho_namcu["D1::カテゴリ・ワード::兵"] = "3"
		suho_namcu["D1::カテゴリ・ワード::寝具"] = "3"
		suho_namcu["D1::カテゴリ・ワード::性愛"] = "2"
		suho_namcu["D1::カテゴリ・ワード::broda"] = "5"
		suho_namcu["D1::カテゴリ・ワード::服飾"] = "12"
		suho_namcu["D1::etc"] = "73"
	}

	{
		meixire = split($(NF - 2), klesixire, "::")
	}

	NR != 0 {
		lanci = 0

		for(xi = 1; xi <= meixipa; xi = xi + 1) {
			if(klesixipa[xi] != klesixire[xi]) {
				if(!lanci) {
					printf("</dl>")
					lanci = 1
				}

				printf("</section>")
			}
		}
	}

	{
		id = ""

		for(xi = 1; xi <= meixire; xi = xi + 1) {
			id = id "::" klesixire[xi]

			if(klesixipa[xi] != klesixire[xi]) {
				printf("<section id=\"%s\" about=\"#%s\" typeof=\"schema:ItemList\">", substr(id, 3), substr(id, 3))
				printf("<h%d title=\"%s\" property=\"dcterms:title\" content=\"%s\"><a class=\"pagbu_judri\" title=\"「%s」へのリンク\" href=\"#%s\">§</a> %s <span property=\"schema:numberOfItems\" datatype=\"xsd:nonNegativeInteger\" content=\"%s\">(%d語)</span></h%d>", xi + 1, substr(id, 3), substr(id, 3), substr(id, 3), substr(id, 3), klesixire[xi], suho_namcu[substr(id, 3)], suho_namcu[substr(id, 3)], xi + 1)

				if(xi == meixire) {
					printf("<dl rel=\"schema:itemListElement\">")
				}
			}
		}

		gsub(/title=""アクセント""/, "", $5)
		gsub(/ondblclick=""[^"]*""/, "ondblclick=\"\"movdu(this);\"\"", $6)
		gsub(/lang=""""/, "lang=\"\"\"\" xml:lang=\"\"\"\"", $6)
		gsub(/lang=""jbo""/, "lang=\"\"jbo\"\" xml:lang=\"\"jbo\"\"", $6)
		gsub(/ondblclick=""[^"]*""/, "ondblclick=\"\"movdu(this);\"\"", $7)
		gsub(/lang=""""/, "lang=\"\"\"\" xml:lang=\"\"\"\"", $7)
		gsub(/lang=""jbo""/, "lang=\"\"\"\"jbo\"\" xml:lang=\"jbo\"", $7)
		gsub("</li><li", "</li>, <li", $9)
		gsub("<li", "<span", $9)
		gsub("</li>", "</span>", $9)
		gsub("\">", "\" property=\"rdfs:label\">", $9)

		printf("<dt id=\"ciksi-zo-%s\" lang=\"jbo\" xml:lang=\"jbo\" about=\"[_:%s]\"><a class=\"pagbu_judri\" title=\"「%s」へのリンク\" rel=\"foaf:page\" href=\"#ciksi-zo-%s\">#</a> <a class=\"voksa_vreji\" title=\"「%s」の音声を再生\" onclick=\"return sance(this);\" rel=\"dcterms:hasFormat\" type=\"audio/mpeg\" href=\"voksa/%s.mp3\">▶</a> <span class=\"lerfu\" title=\"%s\" ondblclick=\"movdu(this);\" property=\"foaf:name\">%s</span> - <span class=\"rafsi\" title=\"rafsi\">(%s)</span></dt>", $2, $2, $2, $2, $2, $2, $4, $5, $9)
		printf("<dd class=\"ve_ciksi\" about=\"[_:%s]\" property=\"dcterms:description\">%s</dd>", $2, $6)

		if($7 != "") {
			printf("<dd class=\"notci\" about=\"[_:%s]\" property=\"dcterms:description\">%s</dd>", $2, $7)
		}

		meixipa = split($(NF - 2), klesixipa, "::")
	}

	END {
		lanci = 0

		for(xi = 1; xi <= meixire; xi = xi + 1) {
				if(!lanci) {
					printf("</dl>")
					lanci = 1
				}

				printf("</section>")
		}
	}
	EOF
)

{
	cat <<-EOF | tr -d '\t\n\r'
	<!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml" lang="ja" xml:lang="ja" about="" typeof="foaf:Document">
		<head>
			<meta charset="UTF-8" />
			<meta name="author" property="dc11:creator" content="qq542vev" />
			<meta name="dcterms.created" property="dcterms:created" datatype="dcterms:W3CDTF" content="2021-06-12" />
			<meta name="dcterms.modified" property="dcterms:modified" datatype="dcterms:W3CDTF" content="$(date '+%Y-%m-%d')" />
			<meta name="description" property="dcterms:description" content="PJCG gismte Lv.1のgisum一覧です。" />
			<meta name="keywords" property="schema:keywords" content="Lojban,gismu,gismte" />
			<meta name="robots" content="index,follow" />

			<title property="dcterms:title">PJCG gismte Lv.1のgismu一覧</title>

			<link rel="author" title="qq542vev" href="https://purl.org/meta/me/" />
			<link rel="dcterms:conformsTo" title="Valid HTML+RDFa 1.1" href="http://www.w3.org/TR/html-rdfa/" />
			<link rel="copyright license" title="LLG Web Copyright License" href="https://mw.lojban.org/papri/LLG_Web_Copyright_License" />
			<link rel="profile grddl:profileTransformation" href="http://ns.inria.fr/grddl/rdfa/" />
			<link rel="start" title="ji'u la'o .zoi. PJCG gimste .zoi." href="https://github.com/qq542vev/jihu-laho-zoi-pjcg-gimste-zoi/" />

			<style type="text/css">
				body {
					margin: 0 auto;
					width: 90%;
					font-family: "Arial", sans-serif;
					line-height: 1.6;
					letter-spacing: 0.04em;
				}

				h1, h2 {
					border-left: 6px solid #000000;
					border-bottom: 3px double #000000;
					padding-left: 10px;
					font-size: 125%;
				}

				h3 {
					border-bottom: 3px double #808080;
					padding-left: 16px;
					font-size: 112.5%;
				}

				h4 {
					border-bottom: 1px solid #808080;
					padding-left: 16px;
					font-size: 100%;
				}

				dt {
					padding-bottom: 0.2em;
					letter-spacing: 0.08em;
				}

				dt:target, dt:target + dd, dt:target + dd + dd {
					background: #F0F0F0;
				}

				dd {
					margin: 0;
					padding-bottom: 0.3em;
					padding-left: 1em;
				}

				u.se_basna {
					border-top: 1px dotted #000000;
					text-decoration: none;
				}

				u.relkarsna {
					text-decoration: none;
				}

				.lerfu {
					font-weight: bold;
				}

				var {
					border: 1px solid #D0D0D0;
					border-radius: 8px;
					padding: 0.1em 0.2em 0.2em 0.2em;
					font-family: "Times New Roman", "Courier", "Garamond", serif;
				}

				var.x1 {
					background: #DAFFFF;
				}

				var.x2 {
					background: #FFDADA;
				}

				var.x3 {
					background: #FFDAFF;
				}

				var.x4 {
					background: #DADAFF;
				}

				var.x5 {
					background: #FFFFDA;
				}

				a.pagbu_judri:link, a.pagbu_judri:visited, a.voksa_vreji:link, a.voksa_vreji:visited {
					text-decoration: none;
					color: #606060;
				}

				a.pagbu_judri:hover, a.pagbu_judri:active, a.voksa_vreji:hover ,a.voksa_vreji:active {
					text-decoration: underline;
					color: #FF0000;
				}
			</style>

			<script type="text/javascript">/*<![CDATA[*/
				"use strict";

				function movdu(cpedu) {
					var url = "https://jbovlaste.lojban.org/dict/";
					location.href = url + cpedu.textContent;
				}

				function sance(cpedu) {
					if(window.HTMLAudioElement) {
						var audioElement = new Audio(cpedu.href);
						audioElement.play();

						return false;
					}

					return true;
				}
			/*]]>*/</script>
		</head>
		<body>
			<main id="ralju" rel="foaf:topic">
				<section>
					<h1>PJCG gismte Lv.1 の gismu 一覧</h1>

					<p><a href="https://cogas.github.io/pages/lojbo/pjcg_gimste/">PJCG gismte Lv.1</a> の gismu 一覧です。ロジバンの単語上でダブルクリックを行うと <a href="https://jbovlaste.lojban.org/">jbovlaste</a> の単語ページに遷移します。</p>

					$(awk "${awkScript}" '../pjcg-gimste-lv1/gimste.csv' | sed -e 's/""/"/g')
				</section>
			</main>
			<footer>
				<p><a href="#top">ページの一番上に移動</a></p>
			</footer>
		</body>
	</html>
	EOF
} >index.html
