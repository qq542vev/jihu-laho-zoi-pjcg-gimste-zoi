#!/usr/bin/env sh

# sh karda-cupra.sh

cd "$(dirname "${0}")"

awkScript=$(
	cat <<-'EOF'
	BEGIN {
		FS = "\",\""
		row = 6
		colmun = 4
		selpaunahu = row * colmun
	}

	function jarco_ciksi(mai) {
		if(mai == "") {
			mai = (NR / selpaunahu);
		}

		printf("</table>")
		printf("<table class=\"trixe\" lang=\"ja\" xml:lang=\"ja\">")
		printf("<caption>%dページ目の単語表の裏面印刷用</caption>", mai)

		for(i = 0; i < selpaunahu; i = i + 1) {
			if((i % colmun) == 0) {
				printf("<tr>")
			}

			namcu = (int((i + colmun) / colmun) * colmun) - (i % colmun) - 1

			if((namcu, "crane") in valsi) {
				gsub(/lang=""/, "lang=\"\" xml:lang=\"\"", valsi[namcu, "trixe"])
				gsub(/lang="jbo"/, "lang=\"jbo\" xml:lang=\"\"jbo\"\"", valsi[namcu, "trixe"])

				printf("<td id=\"trixe-%s\" class=\"nalkunti %s\" title=\"%s\" about=\"[_:%s]\" property=\"dcterms:description\"><a href=\"#crane-%s\">%s</a></td>", valsi[namcu, "crane"], valsi[namcu, "klesi"], valsi[namcu, "crane"], valsi[namcu, "crane"], valsi[namcu, "crane"], valsi[namcu, "trixe"])
			} else {
				printf("<td class=\"kunti\"></td>")
			}

			if((i + 1) % colmun == 0) {
				printf("</tr>")
			}
		}

		printf("</table>")
	}

	(NR % selpaunahu) == 1 {
		split("", valsi)

		printf("<table class=\"crane\" lang=\"jbo\" xml:lang=\"jbo\">")
		printf("<caption lang=\"ja\" xml:lang=\"ja\">%dページ目の単語表の表面印刷用</caption>", (NR / selpaunahu) + 1)
	}

	(NR % colmun) == 1 {
		printf("<tr>")
	}

	{
		gsub("\"\"", "\"", $5)
		gsub("\"\"", "\"", $6)
		vimcuHtml = $6
		gsub(/<[a-z]+[^>]*>|<\/[a-z]+>/, "", vimcuHtml)

		valsi[(NR - 1) % selpaunahu, "crane"] = $2
		valsi[(NR - 1) % selpaunahu, "klesi"] = $4
		valsi[(NR - 1) % selpaunahu, "trixe"] = $6

		printf("<td id=\"crane-%s\" class=\"nalkunti %s\" title=\"%s\" about=\"[_:%s]\" property=\"foaf:name\"><input name=\"%s\" type=\"checkbox\" title=\"「%s」を暗記カード一覧から削除\"/><a href=\"#trixe-%s\">%s</a></td>", $2, $4, vimcuHtml, $2, $2, $2, $2, $5)
	}

	(NR % colmun) == 0 {
		printf("</tr>")
	}

	(NR % selpaunahu) == 0 {
		jarco_ciksi()
	}

	END {
		for(i = NR; (i % selpaunahu) != 0; i = i + 1) {
			if(i % colmun == 0) {
				printf("<tr>")
			}

			printf("<td class=\"kunti\"></td>")

			if((i + 1) % colmun == 0) {
				printf("</tr>")
			}
		}

		if((NR % selpaunahu) != 0) {
			jarco_ciksi(int(NR / selpaunahu) + 1)
		}
	}
	EOF
)

{
	cat <<-EOF | tr -d '\t\n\r'
	<!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml" lang="ja" xml:lang="ja" about="" typeof="schema:WebApplication">
		<head>
			<meta charset="UTF-8" />
			<meta name="author" property="dc11:creator" content="qq542vev" />
			<meta name="dcterms.created" property="dcterms:created" datatype="dcterms:W3CDTF" content="2021-05-19" />
			<meta name="dcterms.modified" property="dcterms:modified" datatype="dcterms:W3CDTF" content="$(date '+%Y-%m-%d')" />
			<meta name="description" property="dcterms:description" content="PJCG gismte Lv.1の単語暗記カードの両面印刷用ページを作成します。" />
			<meta name="keywords" property="schema:keywords" content="Lojban,gismu,gismte" />
			<meta name="msapplication-starturl" content="?" />
			<meta name="robots" content="index,follow" />
			<meta name="version" property="schema:version" content="0.1.0" />

			<title property="dcterms:title">PJCG gismte Lv.1の単語暗記カード印刷用</title>

			<link rel="author" title="qq542vev" href="https://purl.org/meta/me/" />
			<link rel="dcterms:conformsTo" title="Valid HTML+RDFa 1.1" href="http://www.w3.org/TR/html-rdfa/" />
			<link rel="copyright license" title="LLG Web Copyright License" href="https://mw.lojban.org/papri/LLG_Web_Copyright_License" />
			<link rel="profile grddl:profileTransformation" href="http://ns.inria.fr/grddl/rdfa/" />
			<link rel="start" title="ji'u la'o .zoi. PJCG gimste .zoi." href="https://github.com/qq542vev/jihu-laho-zoi-pjcg-gimste-zoi/" />

			<style type="text/css">
				body {
					margin: 0 auto;
					font-size: 87.5%;
					font-family: "Arial", sans-serif;
				}

				header {
					margin: 1em 1.5em;
					padding: 0.5em 1em;
					background: #A0B0B0;
				}

				header p label {
					margin-right: 0.5em;
					display: inline-block;
				}

				input[type="number"] {
					width: 4em;
				}

				#vihuste {
					margin: 1em 0;
					padding: 0;
				}

				#vihuste li {
					display: inline-block;
					margin: 0.2em;
					border: 1px solid #808080;
					background: #FFFFFF;
				}

				#vihuste li:hover {
					background: #F0F0F0;
				}

				#vihuste label {
					display: inline-block;
					padding: 0.5em;
				}

				#vihuste input {
					margin-right: 0.5em;
				}

				#vihuste u.se_basna {
					border-top: 1px dotted #000000;
					text-decoration: none;
				}

				table {
					box-sizing: border-box;
					margin: 1em auto;
					border: 0 solid #000000;
					padding: 0;
					border-collapse: collapse;
					width: 297mm;
					table-layout: fixed;
					page-break-after: always;
				}

				caption {
					margin-bottom: 1em;
					border-bottom: 1px solid #A0A0A0;
					padding: 0.5em;
					background: #F0F0F0;
					font-weight: bold;
				}

				td {
					position: relative;
					border: 0.3mm dashed #000000;
					padding: 0 5mm;
					height: 34.75mm;
					text-align: center;
				}

				td:lang(jbo) {
					font-size: 28pt;
					font-weight: bold;
					letter-spacing: 0.08em;
				}

				td:lang(ja) {
					font-size: 14pt;
					font-family: serif;
				}

				td:target {
					background: #F0F0F0;
				}

				tr:first-of-type td {
					border-top: none;
				}

				tr:last-of-type td {
					border-bottom: none;
				}

				td:first-child {
					border-left: none;
				}

				td:last-child {
					border-right: none;
				}

				td input {
					position: absolute;
					top: 10px;
					right: 10px;
				}

				td a:link, td a:visited {
					text-decoration: none;
					color: #000000;
				}

				td a:hover, td a:active {
					text-decoration: underline;
					color: #000000;
				}

				td u.se_basna {
					border-top: 0.5mm dotted #000000;
					text-decoration: none;
				}

				var {
					font-family: "Times New Roman", "Courier", "Garamond", serif;
				}

				footer {
					margin: 0 1.5em;
				}

				.qr-code {
					position: absolute;
					bottom: 0;
					left: 0;
					width: 15mm;
					background: #FFFFFF;
				}

				.cuxna {
					background: #F4F4F4;
				}

				@page {
					margin: 0;
				}

				@media print {
					header, footer, input {
						display: none;
					}

					table {
						margin: 0 auto;
					}

					caption {
						display: none;
					}

					td:target {
						background: none;
					}
				}
			</style>

			<script type="text/javascript" src="qrcode.js"></script>

			<script type="text/javascript">/*<![CDATA[*/
				"use strict";

				function getUrlQueries() {
					if(location.search.length <= 1) {
						return {};
					}

					return Object.fromEntries(location.search.slice(1).split("&").map(function(queryStr) {
						return queryStr.split("=");
					}));
				}

				function addCss(string) {
						var style = document.createElement("style");
						style.setAttribute("type", "text/css");
						style.innerHTML = string;
						return document.head.appendChild(style);
				}

				function addJvsQr(valsi) {
					var dictURL = "https://jbovlaste.lojban.org/dict/";

					var img = document.createElement("img");
					img.setAttribute("alt", "");
					img.setAttribute("src", "qr-code/" + valsi + ".svg");
					img.setAttribute("class", "qr-code");

					var a = document.createElement("a");
					a.setAttribute("href", dictURL + valsi);
					a.appendChild(img);

					return a;
				}

				function cartu_stika() {
					var form = document.getElementById("cartu_stika").elements;
					var ralju = document.getElementById("ralju");
					var vihuste = document.getElementById("vihuste");

					Array.prototype.forEach.call(ralju.querySelectorAll("td.nalkunti:lang(jbo)"), function(pagbu) {
						if(form[pagbu.textContent]["checked"]) {
							vihuste.appendChild(document.createElement("li"));

							Array.prototype.forEach.call(pagbu.attributes, function(ckaji) {
								vihuste.lastChild.setAttribute(ckaji.name, ckaji.value);
							});

							vihuste.lastChild.appendChild(document.createElement("label"));
							vihuste.lastChild.lastChild.appendChild(form[pagbu.textContent]);

							while(pagbu.lastChild.firstChild) {
								vihuste.lastChild.lastChild.appendChild(pagbu.lastChild.firstChild);
							}

							pagbu.remove();
						}
					});

					var valsi = Array.prototype.map.call(ralju.querySelectorAll("td.nalkunti:lang(jbo)"), function(pagbu) {
						return {
							"crane": pagbu,
							"trixe": document.getElementById("trixe-" + pagbu.textContent)
						};
					});
					var selpaunahu = form.pinpau.value * form.rajypau.value;
					var rajypau_rajnahu = (form.rajnahu.value - (form.nerlihi.value * (form.pinpau.value - 1)) - (form.barlihi.value * 2)) / form.pinpau.value;

					while(ralju.firstChild) {
						ralju.firstChild.remove();
					}

					var css = "@page { margin: " + form.kutnahu.value + "mm 0; }";
					css += "table { border-width: " + form.barlihi.value + "mm; width: " + form.pinynahu.value + "mm; }";
					css += "td { height: " + rajypau_rajnahu + "mm; border-width: " + form.nerlihi.value + "mm; }";
					addCss(css);

					for(var i = valsi.length; (i % selpaunahu) !== 0; i = i + 1) {
						valsi[i] = {};

						["crane", "trixe"].forEach(function(currentValue) {
							valsi[i][currentValue] = document.createElement("td");
							valsi[i][currentValue].setAttribute("class", "kunti");
						});
					}

					for(var i = 0; i < valsi.length; i = i + 1) {
						if((i % form.rajypau.value) === 0) {
							if((i % selpaunahu) === 0) {
								ralju.appendChild(document.createElement("table"));

								ralju.lastChild.setAttribute("class", "crane");
								ralju.lastChild.setAttribute("lang", "jbo");
								ralju.lastChild.setAttribute("xml:lang", "jbo");

								ralju.lastChild.appendChild(document.createElement("caption"));
								ralju.lastChild.lastChild.appendChild(document.createTextNode((Math.floor(i / selpaunahu) + 1) + "ページ目の単語表の表面印刷用"));
								ralju.lastChild.lastChild.setAttribute("lang", "ja");
								ralju.lastChild.lastChild.setAttribute("xml:lang", "ja");
							}

							ralju.lastChild.appendChild(document.createElement("tr"));
						}

						valsi[i]["crane"].style.height = rajypau_rajnahu + "mm";
						ralju.lastChild.lastChild.appendChild(valsi[i]["crane"]);

						if((i % selpaunahu) === (selpaunahu - 1)) {
							ralju.appendChild(document.createElement("table"));

							ralju.lastChild.setAttribute("class", "trixe");
							ralju.lastChild.setAttribute("lang", "ja");
							ralju.lastChild.setAttribute("xml:lang", "ja");

							ralju.lastChild.appendChild(document.createElement("caption"));

							ralju.lastChild.lastChild.appendChild(document.createTextNode((Math.floor(i / selpaunahu) + 1) + "ページ目の単語表の裏面印刷用"));
							ralju.lastChild.lastChild.setAttribute("lang", "ja");
							ralju.lastChild.lastChild.setAttribute("xml:lang", "ja");

							for(var j = i - selpaunahu + 1; j <= i; j = j + 1) {
								if((j % form.rajypau.value) === 0) {
									ralju.lastChild.appendChild(document.createElement("tr"));
								}

								ralju.lastChild.lastChild.appendChild(valsi[j - (j % form.rajypau.value) + (form.rajypau.value - (j % form.rajypau.value)) - 1]["trixe"]);
								ralju.lastChild.lastChild.lastChild.style.height = rajypau_rajnahu + "mm";
							}
						}
					}
				}

				window.onload = function() {
					var form = document.getElementById("cartu_stika").elements;

					Array.prototype.forEach.call(form, function(pagbu) {
						if(("name" in pagbu) && (pagbu.name in this)) {
							pagbu.value = this[pagbu.name];

							if("checked" in pagbu) {
								pagbu.checked = true;
							}
						}
					}, getUrlQueries());

					cartu_stika();

					["crane", "trixe"].forEach(function(farna) {
						var namcu = Number(form[farna + "qr"].value);

						if(namcu) {
							var selector = "." + farna + " td.nalkunti";

							Array.prototype.forEach.call(document.querySelectorAll(selector), function(pagbu) {
								pagbu.appendChild(addJvsQr(pagbu.id.slice(-5)));
							});

							addCss(selector + " .qr-code { width: " + namcu + "mm; }");
						}
					});

					Array.prototype.forEach.call(document.querySelectorAll("td.nalkunti"), function(pagbu) {
						pagbu.ondblclick = function(fasnu) {
							fasnu.target.classList.toggle("cuxna");
						};
					});
				};
			/*]]>*/</script>
		</head>
		<body>
			<form id="cartu_stika" action="?" method="get">
				<header id="stedu">
					<noscript>
						<p>単語暗記カードの表の変更を行う場合は、WebブラウザーのJavaScriptを有効にしてください。</p>
					</noscript>

					<p><a rel="dcterms:references" title="lela.iúk.tánxe - PJCG gimste" href="https://cogas.github.io/pages/lojbo/pjcg_gimste/">PJCG gismte Lv.1</a>の単語暗記カードの両面印刷用ページを作成します。このメッセージは印刷時非表示になります。<a rel="alternate" type="application/pdf" href="a3.pdf">A3</a>, <a rel="alternate" type="application/pdf" href="a4.pdf">A4</a>, <a rel="alternate" type="application/pdf" href="a5.pdf">A5</a>PDFファイルも存在します。このページをダウンロードしたならば、オフラインでも利用可能です。</p>

					<p>
						<label><select size="1" name="pinpau">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6" selected="selected">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
						</select>行</label>

						<label><select size="1" name="rajypau">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4" selected="selected">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
						</select>列</label>

						<label>表の横幅: <input required="required" name="pinynahu" type="number" min="5" value="297" />mm</label>
						<label>表の縦幅: <input required="required" name="rajnahu" type="number" min="5" value="210" />mm</label>
						<label>縦の余白: <input required="required" name="kutnahu" type="number" min="0" value="0" />mm</label>
						<label>外側の線: <input required="required" name="barlihi" type="number" min="0" step="0.1" value="0" />mm</label>
						<label>内側の線: <input required="required" name="nerlihi" type="number" min="0" step="0.1" value="0.3" />mm</label>
						<label>表面のQRコードの幅: <input required="required" name="craneqr" type="number" min="0" step="1" value="0" />mm</label>
						<label>裏面のQRコードの幅: <input required="required" name="trixeqr" type="number" min="0" step="1" value="0" />mm</label>
						<input type="submit" value="変更" />
					</p>

					<ul id="vihuste" lang="jbo" xml:lang="jbo"></ul>
				</header>

				<main id="ralju" rel="foaf:topic">$(awk "${awkScript}" '../pjcg-gimste-lv1/gimste.csv')</main>

				<footer id="#jamfu">
					<p><a href="#top">ページの一番上に移動</a></p>
				</footer>
			</form>
		</body>
	</html>
	EOF
} >'index.html'
