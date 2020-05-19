function [feat,tr]=pitch_feat_tr(te,px)
px_dt=detrend(px);
tr=px-px_dt;
d=diff(tr);
feat=median(d)/(te(2)-te(1)); % pendenza del trend lineare



