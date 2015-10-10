PROGRAM wildcard;

FUNCTION Bruteforce(s, p : STRING): BOOLEAN;
VAR
  is_valid : BOOLEAN;
  i_p, i_s : INTEGER;
BEGIN
  is_valid := true;
  (* Checks length *)
  IF Length(s) = Length(p) THEN BEGIN
    (* Same Length *)
    i_s := 1;
    FOR i_p := 1 TO Length(p) DO BEGIN
      IF p[i_p] = '?' THEN BEGIN
      END ELSE BEGIN    
        IF p[i_p] <>  s[i_s] THEN BEGIN
          is_valid := false;
        END;
      END;
      Inc(i_s);
    END;

  END ELSE BEGIN
    is_valid := false;
  END;

  WriteLn(is_valid);
  
  Bruteforce := is_valid;
END;


FUNCTION Matching(p,s : STRING): BOOLEAN;
VAR
  p_new : STRING;
  s_new : STRING;
BEGIN
  IF (Length(s) = 0) AND (Length(p) = 0) THEN BEGIN
    Matching := TRUE;
  END ELSE
  IF (Length(s) = 0) OR (Length(p) = 0) THEN BEGIN
    Matching := FALSE;
  END ELSE
  IF (p[1] = s[1]) OR (p[1] = '?') THEN BEGIN
      p_new := Copy(p, 2, Length(p)-1);
      s_new := Copy(s, 2, Length(s)-1);
      Matching := Matching(p_new, s_new);
  END ELSE 
  IF p[1] = '*' THEN BEGIN
        s_new := Copy(s, 2, Length(s)-1);
        p_new := Copy(p, 2, Length(p)-1);
        Matching := Matching(p, s_new) OR Matching(p_new, s);
  END ELSE BEGIN
    Matching := FALSE;
  END;
END;



VAR
  s, p : STRING;
BEGIN

Write('Musterkette: '); ReadLn(p);
Write('Zeichenkette: '); ReadLn(s);

IF (s[Length(s)] = '$') AND (p[Length(p)] = '$') THEN BEGIN

  WriteLn(Matching(p,s));
END ELSE BEGIN
  WriteLn('BEHINDAAAT?');
END;


END.