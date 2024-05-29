<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NieuczesanaSpiewaLekcja1.aspx.cs" CodeBehind="NieuczesanaSpiewaLekcja1.aspx.cs" Inherits="NieuczesanaNotpron.NieuczesanaSpiewaLekcja1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Content/style.css"/>
    <title>Nieuczesana spiewa lekcja 1</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>

    <style type="text/css">
        body{
            background-color: black;
        }
        @font-face {
            font-family: 'Digital-7';
            src: url('/resources/fonts/digital-7.regular.ttf') format('truetype');
        }
        .panel{
            border: 1px solid black;
            background-color: gray;
            width: 300px;
            padding: 20px;
            border: 2px solid #333;
            border-radius: 10px;
            background-color: #2f2f2f;
        }
        .keyButton{
            padding: 20px;
            width: 100%;
            height: 60px;
            font-size: 24px;
            border: 2px solid #333;
            border-radius: 10px;
            background-color: #ccc;
            cursor: pointer;
        }
        .kod{
            box-sizing: border-box;
            width: 100%;
            height: 70px;
            font-size: 48px;
            padding: 5px;
            margin-bottom: 10px;
            border: 2px solid #333;
            border-radius: 5px;
            text-align:right;
            font-family: 'Digital-7', sans-serif; /* Dodanie cyfrowej czcionki */
            color: #4dd700;
            background-color: black;
        }

        .panel table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        .panel td {
            padding: 10px;
        }

        .keyButton:hover {
            background-color: #ddd;
        }
    </style>
    <script>
        var audios = {};

        $(document).ready(function () {
            audios['0'] = new Audio('resources/KaroSpiewa/0.wav');
            audios['1'] = new Audio('resources/KaroSpiewa/1.wav');
            audios['2'] = new Audio('resources/KaroSpiewa/2.wav');
            audios['3'] = new Audio('resources/KaroSpiewa/3.wav');
            audios['4'] = new Audio('resources/KaroSpiewa/4.wav');
            audios['5'] = new Audio('resources/KaroSpiewa/5.wav');
            audios['6'] = new Audio('resources/KaroSpiewa/6.wav');
            audios['7'] = new Audio('resources/KaroSpiewa/7.wav');
            audios['8'] = new Audio('resources/KaroSpiewa/8.wav');
            audios['9'] = new Audio('resources/KaroSpiewa/9.wav');
            audios['*'] = new Audio('resources/KaroSpiewa/10.wav');
            audios['#'] = new Audio('resources/KaroSpiewa/11.wav');
        });


        function keyClick(sender) {
            var tbKod = document.getElementById(('<%= tbKod.ClientID %>'));
            tbKod.value += sender.value;
            playStaticAudio(audios[sender.value]);
            if (tbKod.value.length > 12) {
                tbKod.value = tbKod.value.substring(1);
            }
            if (CryptoJS.SHA256(tbKod.value).toString() == "5c3ec2b745fc460cfa578bbec8f138fc93321d908cef13be610a5496ac6d2e96") {
                var btnSubmit = document.getElementById(('<%= btnSubmit.ClientID %>'));
                btnSubmit.click();
            }
        }
        function playStaticAudio(audio) {
            audio.play();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center-screen">
            <div class="panel">
                <asp:TextBox runat="server" ID="tbKod" Width="100%" CssClass="kod" />
                <table>
                    <tr>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="1">1</button>
                        </td>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="2">2</button>
                        </td>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="3">3</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="4">4</button>
                        </td>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="5">5</button>
                        </td>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="6">6</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="7">7</button>
                        </td>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="8">8</button>
                        </td>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="9">9</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="*">*</button>
                        </td>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="0">0</button>
                        </td>
                        <td>
                            <button onclick="keyClick(this);" class="keyButton" type="button" value="#">#</button>
                        </td>
                    </tr>
                </table>
                
            </div>
        </div>
        <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" style="display:none" />
    </form>
</body>
</html>
